using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class ViewRender : MonoBehaviour
{
    private GameObject normalObj;
    private GameObject specialObj;
    private Transform viewer;
    //private LightCollider2D lightCollider2D;

    private bool special;
    void OnEnable()
    {
        //lightCollider2D = GetComponentInChildren<LightCollider2D>();
        if (transform.childCount >= 2)
        {           
            normalObj = transform.GetChild(0).gameObject;
            specialObj = transform.GetChild(1).gameObject;
        }
    }
    public void BindViewer(Transform _viewer)
    {
        viewer = _viewer;
    }
    public void UnBindViewer()
    {
        viewer = null;
        
    }

   
    void SetDisplay()
    {
        if (viewer && viewer.position.y > transform.position.y)
        {
            if (!special)
            {
                special = true;
                normalObj.SetActive(false);
                specialObj.SetActive(true);
               // lightCollider2D.enabled = false;
            }
            
        }
        else if(special)
        {
            special = false;
            normalObj.SetActive(true);
            specialObj.SetActive(false);
            //lightCollider2D.enabled = true;
        }
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        SetDisplay();
    }
}
