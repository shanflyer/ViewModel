using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjManager : MonoBehaviour
{
    Camera[] cameras;
    float screenHeight;
    private int index0, index1;

    public List<GameObject> bobjs;
    public List<GameObject> fobjs;
    private void Awake()
    {
        cameras = FindObjectsOfType<Camera>();
    }
    // Start is called before the first frame update
    void Start()
    {
        RefreshLightCollider2D();
        SetCameraSize();
    }
    void RefreshLightCollider2D()
    {
        var lightColliders = FindObjectsOfType<LightCollider2D>();
        SortedSet<LightCollider2D> sortedList = new SortedSet<LightCollider2D>();
        foreach (var lightCollider in lightColliders)
        {
            lightCollider.enabled = false;
            sortedList.Add(lightCollider);
        }
        foreach (var lightCollider in sortedList)
        {
            lightCollider.enabled = true;
        }
    }
    public void SwitchObjB()
    {
        foreach (var obj in bobjs)
        {
            obj.SetActive(false);
        }
        index0++;
        index0 = index0 >= bobjs.Count ? 0 : index0;
        bobjs[index0].SetActive(true);
    }
    public void SwitchObjF()
    {
        foreach (var obj in fobjs)
        {
            obj.SetActive(false);
        }
        index1++;
        index1 = index1 >= fobjs.Count ? 0 : index1;
        fobjs[index1].SetActive(true);
    }
    void SetCameraSize()
    {
        int value = (int)(Screen.height / 540.0f);
        value = value < 1 ? 1 : value;
        foreach(var c in cameras)
        {
            c.orthographicSize = Screen.height /( value*200.0f);
        }
        screenHeight = Screen.height;
    }
    // Update is called once per frame
    void Update()
    {
        if (screenHeight != Screen.height)
        {
            SetCameraSize();
        }
    }
}
