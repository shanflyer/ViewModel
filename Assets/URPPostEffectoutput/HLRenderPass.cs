using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

//namespace UnityEngine.Experiemntal.Rendering.Universal
//{
public class HLRenderPass : ScriptableRenderPass
{
    public Material mMat;
    public Shader StencilProcessShader;
    
    //使用第几个pass
    public int blitShaderPassIndex = 0;

    public FilterMode filterMode { get; set; }
    private RenderTargetIdentifier source { get; set; }
    private RenderTargetHandle destination { get; set; }
    private RenderTargetHandle m_temporarySoureTexture;
    private RenderTargetHandle m_temporaryColorTexture;

    private string m_ProfilerTag;//专门给profiler看的名字
    Vector2 pixelNum;

    public HLRenderPass(string passname, RenderPassEvent _event, Material _mat, Shader _StencilProcessShader)
    {
        m_ProfilerTag = passname;
        this.renderPassEvent = _event;
        mMat = _mat;
        StencilProcessShader = _StencilProcessShader;
        //pixelNum = mMat.GetVector("_PixelNumber");


       


        m_temporaryColorTexture.Init("temporaryColorTexture");
        m_temporarySoureTexture.Init("temporarySoureTexture");
    }

    public void Setup(RenderTargetIdentifier src, RenderTargetHandle dest)
    {
        this.source = src;
        this.destination = dest;
    }

    public override void Execute(ScriptableRenderContext context, ref RenderingData renderingData)
    {
        CommandBuffer cmd = CommandBufferPool.Get(m_ProfilerTag);
        
        RenderTextureDescriptor opaqueDesc = renderingData.cameraData.cameraTargetDescriptor;
        opaqueDesc.depthBufferBits = 0;

        //不能读写同一个颜色target，创建一个临时的render Target去blit
        if (destination == RenderTargetHandle.CameraTarget)
        {
            /*
            float sValue = Screen.width / (float)Screen.height;
            pixelNum.x = (int)(pixelNum.y * sValue);

            mMat.SetVector("_PixelNumber", pixelNum);
            */
            cmd.GetTemporaryRT(m_temporarySoureTexture.id, opaqueDesc, filterMode);
            cmd.Blit(source, m_temporarySoureTexture.Identifier());

            cmd.GetTemporaryRT(m_temporaryColorTexture.id, opaqueDesc, filterMode);
            Blit(cmd, m_temporarySoureTexture.Identifier(), m_temporaryColorTexture.Identifier(), mMat, blitShaderPassIndex);
            Blit(cmd, m_temporaryColorTexture.Identifier(), source);
        }
        else
        {
            Blit(cmd, source, destination.Identifier(), mMat, blitShaderPassIndex);
        }
        context.ExecuteCommandBuffer(cmd);
        CommandBufferPool.Release(cmd);
    }

    public override void FrameCleanup(CommandBuffer cmd)
    {
        if (destination == RenderTargetHandle.CameraTarget)
        {
            cmd.ReleaseTemporaryRT(m_temporarySoureTexture.id);
            cmd.ReleaseTemporaryRT(m_temporaryColorTexture.id);
        }
            
    }
}

//}