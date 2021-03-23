using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DemoPlayerController : MonoBehaviour
{
    public float speed;
    private GameObject player;
    private Animator[] animators;
    private Vector2 _Direction;
    private CharacterView characterView;
    private VariableJoystick variableJoystick;
    public List<GameObject> objs;
    private int index;
    
    public Vector2 Direction
    {
        get { return _Direction; }
        set
        {
            _Direction = value;
            float angel = CharacterView.VectorAngle(Vector2.up, _Direction);
            player.transform.GetChild(0).GetChild(0).localEulerAngles = new Vector3(0, -angel, 0);           
            //modelShadow.localEulerAngles = new Vector3(0, -angel, 0);
        }
    }
    private void Awake()
    {
        player = GameObject.Find("Player");
        animators = player.GetComponentsInChildren<Animator>();
       
        characterView = player.GetComponentInChildren<CharacterView>();
        variableJoystick = FindObjectOfType<VariableJoystick>();

      
    }
    public void PlayAnimatorState()
    {
       
    }
    public void SwitchObj()
    {
        foreach(var obj in objs)
        {
            obj.SetActive(false);
        }
        index++;
        index = index >= objs.Count ? 0 : index;
        objs[index].SetActive(true);
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }
    public void SetShadowAngle(Slider slider)
    {
        LightingManager2D.instance.profile.dayLightingSettings.direction = Mathf.Lerp(0, 120, slider.value);
    }
    void SetAnimator(string name,bool value)
    {
        foreach(var a in animators)
        {
            a.SetBool(name, value);
        }
    }
    // Update is called once per frame
    void Update()
    {
        if (variableJoystick.Direction.magnitude == 0)
        {
            if (Input.GetAxis("Horizontal") != 0 || Input.GetAxis("Vertical") != 0)
            {
                Direction = new Vector2(Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"));

                characterView.direct = Direction.normalized;
                SetAnimator("Run", true);
                SetAnimator("Moving", true);
            
                player.transform.Translate(Direction.normalized * speed);
            }
            else
            {
                SetAnimator("Run", false);
                SetAnimator("Moving", false);
            }
        }
        else
        {
            Direction = variableJoystick.Direction;

            characterView.direct = Direction.normalized;
            SetAnimator("Run", true);
            SetAnimator("Moving", true);
            player.transform.Translate(Direction.normalized * speed);
        }
        
       // Vector3 pos = player.transform.position;
        //player.transform.position=new Vector3(pos.x,pos.y,pos.y);
    }
}
