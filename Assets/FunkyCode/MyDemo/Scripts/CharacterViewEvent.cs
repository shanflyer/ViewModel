using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterViewEvent : MonoBehaviour
{
    
    private CharacterView characterView;
 
    private void OnEnable()
    {
        characterView = transform.GetComponentInParent<CharacterView>();
		//resolution = (int)degrees;
    }

    void LateUpdate()
    {
       
    }
    public void SetColliderAngle()
    {
        var angles = transform.parent.eulerAngles;

        transform.localEulerAngles = new Vector3(0, 0, -angles.z);

    }
    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (characterView)
        {
            characterView.TriggerEnter(collision.transform,transform.name);
        }
    }

    private void OnTriggerExit2D(Collider2D collision)
    {
        if (characterView)
        {
           characterView.TriggerExit(collision.transform, transform.name);
        }
    }
    // Start is called before the first frame update
    void Start()
	{

	}

	// Update is called once per frame
	void Update()
	{

	}
}
