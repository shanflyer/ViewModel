#pragma warning disable 0618

using System.Collections.Generic;
using UnityEngine;

#if UNITY_EDITOR
#endif

public class ZippyLights2D : MonoBehaviour
{
    [Tooltip("How many rays and points the light emits.")]
    [Range(10, 720)]
    public int resolution = 50;

    [Tooltip("Light area degrees.")]
    [Range(10, 360)]
    public float degrees = 360f;     

    [Tooltip("What physics layers light interacts with.")]
    public LayerMask layers = -1;

    [Tooltip("How far the light travels.")]
    public float range = 15f;

    public Transform cacheTransform;
    MeshRenderer cacheMeshRenderer;
    public MeshFilter cacheMeshFilter;
    Vector3[] verts;
    Color[] colors;
    int[] tris;
    Vector2[] u;
    Mesh lightMesh;

    private Vector3[] points;               // Holds list of all point raycast hits and default point positions.
    private Vector3[] pointsF;              // Holds list of all point raycast hits and default point positions.
    private Vector3[] pointsX;              // Previous version of points, used to compare positions from newly genereated points with the previous.
    private Vector3[] pointsP;              // Holds list of only point positions where the raycast hit something, no default point positions.
    private float[] str;                    // List of how far away a "points" point is from center.

    private int pointsPlenght = 0;
    private float degreeResolution;

    private PolygonCollider2D cachePolygonCollider;
    private CharacterViewEvent characterViewEvent;

    private void Awake()
    {
        characterViewEvent = GetComponentInChildren<CharacterViewEvent>();
        cachePolygonCollider = GetComponentInChildren<PolygonCollider2D>();      
        
        Init();
    }

    public void Init()
    {
        lightMesh = cacheMeshFilter.mesh;
        if (lightMesh == null) lightMesh = new Mesh();
        if (points == null) points = new Vector3[resolution];
        pointsF = new Vector3[resolution];
        degreeResolution = degrees / resolution;
        Brighten(true);
    }

    public void Brighten(bool forceBrighten = false)
    {
        if (lightMesh == null) lightMesh = new Mesh();
      
        ScanPoints();
        MeshGen();
    }

    private void ScanPoints()
    {
        degreeResolution = degrees / resolution;

        if (points == null || points.Length != resolution) points = new Vector3[resolution];
        if (pointsP == null || pointsP.Length != resolution) pointsP = new Vector3[resolution];
        if (str == null || str.Length != resolution) str = new float[resolution];

        pointsPlenght = 0;
        Vector3 d = transform.up;
        int pr = (int)(resolution);
        Vector3 f = Vector3.forward;
        //hits.Clear();

        for (int i = 0; i < resolution; i++)
        {
            Quaternion q = Quaternion.AngleAxis((float)(i * degreeResolution), f);
            Vector3 qd = q * d;

            RaycastHit2D hit = Physics2D.Raycast(transform.position, qd, range, layers);
            float dist = hit.distance;
            if (hit)
            {
                if (i % pr == Random.Range(0, pr + 1))
                {
                    pointsP[pointsPlenght] = hit.point;

                    pointsPlenght++;
                }
                //if (i == (int)Random.Range(0, resolution)) Debug.Log(hit.collider.gameObject);
                points[i] = hit.point;

                str[i] = 1 - dist / range;

                //hits.Add(hit.transform.parent);
            }
            else
            {
                points[i] = transform.position + qd * range;
                str[i] = 0;
            }

            //pointsF[i] = Vector2.MoveTowards(points[i], transform.position, 0);
        }
    }

    private void MeshGen()
    {    

        int l = points.Length + 2;
        if (verts == null) verts = new Vector3[l];
        if (tris == null) tris = new int[l * 3 + 3];

        if (colors == null) colors = new Color[l];
        if (verts.Length > 0) verts[0] = cacheTransform.InverseTransformPoint(cacheTransform.position);


        for (int i = 0; i < points.Length + 1; i++)
        {
            int i2 = i + 1;
            verts[i2] = cacheTransform.InverseTransformPoint(points[i % points.Length]);

        }

        if (resolution != verts.Length)
        {
            lightMesh.Clear();
            int n = 0;
            if (degrees < 360)
                n = -2;
            int x = 0;
            for (var i = 0; i < verts.Length + n; i++)
            {
                tris[x] = (i + 1) % verts.Length;
                x++;
                tris[x] = i % verts.Length;
                x++;
                tris[x] = 0;
                x++;
            }
            lightMesh.vertices = verts;
            lightMesh.triangles = tris;
        }
        else
        {
            lightMesh.vertices = verts;
        }
        lightMesh.colors = colors;
        if (u == null) u = new Vector2[verts.Length];
        float r = range;
        for (int i = 0; i < verts.Length; i++)
        {
            float r2 = r * .5f;
            u[i] = new Vector2(verts[i].x / r2 + .5f, verts[i].y / r2 + .5f);
        }
        lightMesh.uv = u;

        cacheMeshFilter.mesh = lightMesh;


        if (pointsX != null && pointsX.Length != resolution) return;
        int len = points.Length;
        if (pointsX == null) pointsX = new Vector3[len];
        System.Array.Copy(points, pointsX, len);
        
        HashSet<Vector3> _points = new HashSet<Vector3>();
        foreach (var point in points)
        {
            _points.Add(point);
        }
        characterViewEvent.SetColliderAngle();
        if (cachePolygonCollider && _points.Count > 1)
        {
            cachePolygonCollider.points = AsV2(points);
        }
    }

    public Vector2[] AsV2(Vector3[] src)
    {
        Vector2[] ret = new Vector2[src.Length + 1];
        for (int i = 0; i < src.Length; i++) ret[i] = new Vector2(src[i].x - transform.position.x, src[i].y - transform.position.y);
        ret[src.Length] = Vector2.zero;
        return ret;
    }
}