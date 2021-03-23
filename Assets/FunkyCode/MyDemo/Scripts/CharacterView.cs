//using SentingGame;
using System.Collections.Generic;
using UnityEngine;

public class CharacterView : MonoBehaviour
{
    public static bool viewDisplay;
    private float angle;
    private bool open;
    //private Character3D character3D;
    private Transform renderParent;
    private bool isPlayer;

    private Light2D _frontLight;
    private Light2D _cycleLight;
    private ZippyLights2D _frontZippyLights2D;
    private ZippyLights2D _cycleZippyLights2D;
    //private CinemachineVirtualCamera CMVcam1;
    private Camera lightingCamera;
    private Light2D frontLight {
        get
        {
            if (!_frontLight)
            {
                _frontLight=transform.GetChild(0).GetChild(0).GetComponentInChildren<Light2D>();
            }
            return _frontLight;
        }
    }
    private Light2D cycleLight
    {
        get
        {
            if (!_cycleLight)
            {
                _cycleLight= transform.GetChild(0).GetChild(1).GetComponentInChildren<Light2D>();
            }
            return _cycleLight;
        }
    }
    private ZippyLights2D frontZippyLights2D
    {
        get
        {
            if (!_frontZippyLights2D)
            {
                _frontZippyLights2D= transform.GetChild(0).GetChild(0).GetComponentInChildren<ZippyLights2D>();
            }
            return _frontZippyLights2D;
        }
    }
    private ZippyLights2D cycleZippyLights2D
    {
        get
        {
            if (!_cycleZippyLights2D)
            {
                _cycleZippyLights2D = transform.GetChild(0).GetChild(1).GetComponentInChildren<ZippyLights2D>();
            }
            return _cycleZippyLights2D;
        }
    }

    private Vector2 _direct;
    public Vector2 direct { set { _direct = value; }
        get
        {
            return _direct;
        }
    }
    private HashSet<Transform> hits0 = new HashSet<Transform>();
    private HashSet<Transform> hits1 = new HashSet<Transform>();

    public void UpDataView()
    {
        frontZippyLights2D.Brighten();
        cycleZippyLights2D.Brighten();
    }
    public void TriggerEnter(Transform transform,string triggerName)
    {
        switch (triggerName)
        {
            case "0":
                hits0.Add(transform);
                if (!hits1.Contains(transform))
                {
                    TransformEnter(transform);
                }
                break;
            default:
                hits1.Add(transform);
                if (!hits0.Contains(transform))
                {
                    TransformEnter(transform);
                }
                break;
        }
    }
    public void TriggerExit(Transform transform, string triggerName)
    {
        switch (triggerName)
        {
            case "0":
                hits0.Remove(transform);
                if (!hits1.Contains(transform))
                {
                    TransformExit(transform);
                }
                break;
            default:
                hits1.Remove(transform);
                if (!hits0.Contains(transform))
                {
                    TransformExit(transform);
                }
                break;
        }
    }
    public void SetCharacterObjAlive(bool alive)
    {
        renderParent.localPosition = alive ? new Vector3(0,0,0) : new Vector3(0, 0, -9999999.0f);
       
    }
    void TransformEnter(Transform parent)
    {
        if (parent.tag == "npc"||parent.tag == "player"|| parent.tag == "ignore")
        {
            //Debug.Log(obj.transform.parent.name+",enter");
            CharacterView characterView = parent.GetComponentInChildren<CharacterView>();
            if (characterView != null)
            {
                characterView.SetCharacterObjAlive(true);

                /*
                Character3D role = parent.GetComponent<Character3D>();
                if (role != null)
                { 
                    EventDispatcher.TriggerEvent(EventKey.RoleView, role.Attribute.Guid,true);
                }*/
            }
        }
        else
        {
            ViewRender viewRender = parent.GetComponentInChildren<ViewRender>();
            if (viewRender != null)
            {
                viewRender.BindViewer(transform);
            }
            if (parent.gameObject.activeSelf && parent.gameObject.TryGetComponent(out AfterFreezeObject afterFreezeObject))
            {
                afterFreezeObject.LookIn();
            }
            UpDataView();
        }
    }
    void TransformExit(Transform parent)
    {
        if (parent.tag == "npc"||parent.tag == "player"||parent.tag=="ignore")
        {
            CharacterView characterView = parent.GetComponentInChildren<CharacterView>();
            if (characterView != null)
            {
                characterView.SetCharacterObjAlive(false);
                /*
                Character3D role = parent.GetComponent<Character3D>();
                if (role != null)
                {
                    EventDispatcher.TriggerEvent(EventKey.RoleView, role.Attribute.Guid,false);
                }*/
            }
        }
        else
        {
            ViewRender viewRender = parent.GetComponentInChildren<ViewRender>();
            if (viewRender != null)
            {
                viewRender.UnBindViewer();
            }
            
            AfterFreezeObject objfreeze = parent.GetComponentInChildren<AfterFreezeObject>();
            if (objfreeze != null)
            {
                objfreeze.LookOut();
            }
           UpDataView();
        }
    }
    public void SetView(bool _open)
    {
        open = _open;
        transform.GetChild(0).gameObject.SetActive(open);
    }
    public static float VectorAngle(Vector2 from, Vector2 to)
    {
        float angle;

        Vector3 cross = Vector3.Cross(from, to);
        angle = Vector2.Angle(from, to);
        return cross.z > 0 ? angle : -angle;
    }
    private void OnEnable()
    {

        renderParent=transform.parent.GetChild(1);

        viewDisplay = true;
        open = true;
        isPlayer = true; 
        angle = VectorAngle(Vector2.up, direct);
        transform.localEulerAngles = new Vector3(0, 0, angle);

        SetCharacterObjAlive(true);
       
        UpDataView();



        /*
        character3D = transform.parent.GetComponent<Character3D>();
        if (character3D != null && character3D == PlayerManager.Instance.CurrentPlayer)
        {
            CMVcam1 = CameraController.Instance.GetCM((int)CinemachineVirtualCameraType.followRole);
            viewDisplay = true;
            open = true;
            isPlayer = true;
            character3D = transform.parent.GetComponent<Character3D>();
            angle = VectorAngle(Vector2.up, character3D.Direction);
            transform.localEulerAngles = new Vector3(0, 0, angle);

            SetCharacterObjAlive(true);
            if (character3D.Attribute != null)
            {
                RoleData rd = character3D.Attribute.LevelModel;
                SetCycleViewRange(rd.basicView);
                SetFrontViewRange(rd.sectorView[0]);
                SetViewAngle(rd.sectorView[1]);
            }
            UpDataView();
        }*/
    }

    // Start is called before the first frame update
    private void Start()
    {
      
        Vector3 pos = transform.parent.position;
        pos.z = 0;
        transform.parent.position = pos;

        if (!isPlayer)
        {
            SetCharacterObjAlive(false);
            foreach (Transform child in transform)
            {
                child.gameObject.SetActive(false);
            }
            //this.enabled = false;            
            return;
        }
        else
        {
            var myViewCollider = GetComponent<PolygonCollider2D>();
            if (myViewCollider)
            {
                myViewCollider.enabled = false;
            }

            // SetCharacterObjAlive(true);
        }



    }
    //视野角度
    public void SetViewAngle(float angle)
    {
        frontLight.spotAngle = angle+frontLight.outerAngle;
        cycleLight.spotAngle = 360 - angle+cycleLight.outerAngle-5;
        frontZippyLights2D.degrees = angle;
        cycleZippyLights2D.degrees = 360 -angle;
        frontZippyLights2D.transform.localEulerAngles = new Vector3(0, 0, -angle / 2);
        cycleZippyLights2D.transform.localEulerAngles = new Vector3(0, 0, -(360-angle) / 2);
    }
    //整体视野范围，圆形半径是扇形的1/5
    public void SetViewRange(float range)
    {
        frontLight.size = range;
        cycleLight.size = range / 5;

        frontZippyLights2D.range = range;
        cycleZippyLights2D.range = range / 5;
    }
    //前方扇形半径
    public void SetFrontViewRange(float range)
    {
        frontLight.size = range;
        frontZippyLights2D.range = range;
    }
    //周围圆形半径
    public void SetCycleViewRange(float range)
    {
        cycleLight.size = range;
        cycleZippyLights2D.range = range;
    }

    public void RefreshView()
    {
        angle = VectorAngle(Vector2.up, direct);
        transform.localEulerAngles = new Vector3(0, 0, angle);
        
    }
    // Update is called once per frame
    private void Update()
    {
        if (isPlayer&&open)
        {
            angle = VectorAngle(Vector2.up, direct);
            transform.localEulerAngles = new Vector3(0, 0, angle);

            Camera.main.transform.position = new Vector3(transform.parent.position.x, transform.parent.position.y, -50);

        }
        
    }
}