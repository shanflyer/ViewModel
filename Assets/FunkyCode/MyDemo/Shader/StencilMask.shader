Shader "Unlit/StencilMask"
{
    Properties
    {
        _RefValue("Stencil RefValue",Int) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _Comp ("_Comp", Int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _Pass ("_Pass", Int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _Fail ("_Fail", Int) = 0
    }
    SubShader
    {
        //Queue 渲染队列设置到 Geometry-1 是因为想在被遮挡物体渲染之前就进行渲染,写入stencil值
        Tags { "RenderType"="Opaque" "Queue"="Geometry-1"}

        //[_RefValue]就是我们自己设置的参考值
        //Always表示了无论如何都通过模板测试
        //Replace表示通过模板测试后用参考值替换掉Stencil Buffer中此像素原有的stencil值(缓冲值)
        Stencil{
           Ref [_RefValue]
            Comp [_Comp] 
            Pass [_Pass]
            Fail [_Fail]
        }

        //关闭深度写入,因为是四边形面片Queue较小,较先渲染
        //如果还开启深度写入,后续的面世界内的物体都不能通过深度测试(Depth Test),就都不会被显示出来了.
        ZWrite Off

        //关闭颜色写入
        ColorMask 0

        Pass{
        //普通正常Unlit的Pass
        }
    }
}
