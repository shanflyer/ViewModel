using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AfterFreezeObject : MonoBehaviour
{
    float particleLerpTime = 1.0f;  

    public Dictionary<ParticleSystem, ParticleSystem> particleKVPart=new Dictionary<ParticleSystem, ParticleSystem>();
    private List<Renderer> realRenders, virtualRenders;
    private Transform realTrans;


    void SetParticleLerpTime(float time)
    {
        particleLerpTime = time;
    }
    public void Init(Transform _realTrans,List<Renderer> _realRenders, List<Renderer> _virtualRenders)
    {
        particleKVPart.Clear();
        realRenders = _realRenders;
        virtualRenders = _virtualRenders;
        realTrans = _realTrans;
    }
 
    IEnumerator LerpParticleValue(bool display)
    {
        float time = 0.0f;
        while (time < particleLerpTime)
        {            
            time += Time.deltaTime;
            foreach (var item in particleKVPart)
            {
                var keyem = item.Key.emission;
                float valueConstant = (item.Value) ?item.Value.emission.rateOverTime.constant:0;
                keyem.rateOverTime = Mathf.Lerp(keyem.rateOverTime.constant, valueConstant, time/particleLerpTime);
            }
            yield return 0;
        }
        if (realTrans)
        {
            realTrans.position = new Vector3(realTrans.transform.position.x, realTrans.transform.position.y, display?0:-10000);
            transform.position = new Vector3(transform.position.x, transform.position.y, display ? -10000:0);
        }
        else
        {
            Destroy(gameObject);
        }

    }
  
 
    public void LookIn()
    {
        particleKVPart.Clear();
        for(int i = 0; i < virtualRenders.Count; i++)
        {
            if (virtualRenders[i] != null)
            {
                var virtualParticleSystem = virtualRenders[i].GetComponent<ParticleSystem>();
                if (virtualParticleSystem!=null)
                {
                    particleKVPart.Add(virtualParticleSystem, realRenders[i].GetComponent<ParticleSystem>());
                }
               
            }
           
        }
        if (particleKVPart.Count > 0)
        {
            StopAllCoroutines();
            StartCoroutine(LerpParticleValue(true));
        }
        else
        {
            if (realTrans)
            {
                realTrans.position = new Vector3(realTrans.transform.position.x, realTrans.transform.position.y, 0);
                transform.position = new Vector3(transform.position.x, transform.position.y, -1000);
            }
            else
            {
                Destroy(gameObject);
            }          
            
        }
        
    }


    public void LookOut()
    {
        particleKVPart.Clear();
        for (int i = 0; i < realRenders.Count; i++)
        {
            if (realRenders[i] != null)
            {
                var realParticleSystem = realRenders[i].GetComponent<ParticleSystem>();
                if (realParticleSystem != null)
                {
                    particleKVPart.Add(realParticleSystem, virtualRenders[i].GetComponent<ParticleSystem>());
                }

            }

        }
        if (particleKVPart.Count > 0)
        {
            StopAllCoroutines();
            if (gameObject.activeSelf) { StartCoroutine(LerpParticleValue(false)); }
            
        }
        else
        {
            if (realTrans)
            {
                realTrans.position = new Vector3(realTrans.transform.position.x, realTrans.transform.position.y, -10000);
                transform.position = new Vector3(transform.position.x, transform.position.y, 0);
            }
            else
            {
                Destroy(gameObject);
            }

        }

    }    
}
