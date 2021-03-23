using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;
//using SentingGame;
public class ObjectFreezeManager
{
    private static Dictionary<int, GameObject> ObjectFreezeObjs = new Dictionary<int, GameObject>();
    public static GameObject GetObjectFreezeObj(int guid)
    {
        if (ObjectFreezeObjs.ContainsKey(guid))
        {
            return ObjectFreezeObjs[guid];
        }
        return null;
    }
    public static void AddObjectFreezeObj(int guid, GameObject virtualObj)
    {
        ObjectFreezeObjs.Add(guid, virtualObj);
    }
}
public class ObjectFreeze : MonoBehaviour
{
    
    public List<Renderer> renders=new List<Renderer>();

    //public GameObject clone;

    public GameObject PolygonColliderObj;
    AfterFreezeObject aft;
    private int guid;
    private string roomId="";
    
    // Start is called before the first frame update
    void Start()
    {
       /*

        var sceneName = SceneManager.GetActiveScene().name;
        if (sceneName == "newSceneEdit"||
            sceneName== "newItemEdit" ||
            sceneName== "newMapRoadEdit")
        {
            return;
        }
        var position = transform.parent.position;
        var clone = ObjectFreezeManager.GetObjectFreezeObj(guid);
        if (clone)
        {            
            clone.transform.position = new Vector3(position.x,position.y,0);
            clone.SetActive(true);
            SetAfterFreezeObjectData();
        }
       */
        //SetAfterFreezeObjectData();
        // aft.LookOut();
        //transform.parent.position = new Vector3(position.x, position.y, -10000);
    }
    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (ObjectFreezeManager.GetObjectFreezeObj(guid)==null)
        {
            CreatCloneObj();
        }
    }
    public void CreatCloneObj()
    {
       GameObject clone = new GameObject($"{transform.parent.name}(FreezeClone)");
        clone.transform.position = transform.parent.parent.position;
        clone.tag = "FreezeObj";
        GameObject clonechild = new GameObject($"LightTrigger");
        clonechild.transform.position = transform.parent.parent.position;
        clonechild.transform.parent = clone.transform;
        clonechild.layer = LayerMask.NameToLayer("Trigger");
        clonechild.tag = PolygonColliderObj.tag;
        PolygonCollider2D collider = clonechild.AddComponent<PolygonCollider2D>();
        collider.points = PolygonColliderObj.GetComponent<PolygonCollider2D>().points;
        collider.isTrigger = true;
        clone.transform.parent = transform.parent.parent;
        ObjectFreezeManager.AddObjectFreezeObj(guid, clone);
        aft = clone.GetComponent<AfterFreezeObject>();
        clone.SetActive(true);
        SetAfterFreezeObjectData();
    }
   
    void SetAfterFreezeObjectData()
    {
        renders = transform.parent.GetComponentsInChildren<Renderer>().ToList();
        var clone= ObjectFreezeManager.GetObjectFreezeObj(guid);
        List<Renderer> virtualRenders = new List<Renderer>();
        foreach (var render in renders)
        {
            GameObject renderObj = Instantiate(render.gameObject);
            renderObj.transform.SetParent(clone.transform, true);
            renderObj.transform.localPosition = render.transform.localPosition;
            renderObj.transform.localRotation = render.transform.localRotation;
            
            virtualRenders.Add(renderObj.GetComponent<Renderer>());
        }

        aft = clone.GetComponent<AfterFreezeObject>()??clone.AddComponent<AfterFreezeObject>();
        aft.Init(transform.parent, renders, virtualRenders);
    }
  

    private void OnEnable()
    {
        /*
        guid = GetComponentInParent<TRoomComp>().Data.Guid;
        roomId = MainModel.Current.RoomId;
        var position = transform.parent.position;
        transform.parent.position = new Vector3(position.x, position.y, -10000);
        */
        // transform.parent.position = new Vector3(position.x, position.y, 0);

    }

    private void OnDisable()
    {
        /*
        if (roomId != MainModel.Current.RoomId)
        {           
            roomId = MainModel.Current.RoomId;
            if (aft)
            {
                aft.gameObject.SetActive(false);
            }
            
        }*/
        var position = transform.parent.position;
        transform.parent.position = new Vector3(position.x, position.y, -10000);

    }
}
