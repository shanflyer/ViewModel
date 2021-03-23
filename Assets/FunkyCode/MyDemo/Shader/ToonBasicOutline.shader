Shader "Toon/Basic Outline1" 
{
    Properties 
    {
        _OutlineColor ("Outline Color", Color) = (0,0,0,1)
        _Outline ("Outline width", Range (0, 5)) = .005
    }
    SubShader 
    {
        Tags { "Queue" = "Transparent" "RenderType"="Opaque" }
        
        Cull Front
        ZWrite On
        ColorMask RGB
        Blend SrcAlpha OneMinusSrcAlpha
        
        Pass 
        {
            Name "OUTLINE"
            
            HLSLPROGRAM
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            
            #pragma vertex vert3
            #pragma fragment frag
            #pragma multi_compile_fog
            
            CBUFFER_START(UnityPerMaterial)
            float _Outline;
            float4 _OutlineColor;
            CBUFFER_END
            
            struct Attributes 
            {
                float4 positionOS : POSITION;
                float3 normalOS : NORMAL;
                
                float4 vertexColor : COLOR;
                float4 uv0 : TEXCOORD0;
                float4 tangent : TANGENT;
      
                #if UNITY_VERSION >= 550
                    UNITY_VERTEX_INPUT_INSTANCE_ID
                #endif
            };
            
            struct Varyings 
            {
                float4 positionCS : SV_POSITION;
                half fogCoord : TEXCOORD0;
                half4 color : COLOR;
            };            
            
           
            Varyings vert3(Attributes input) 
            {
                Varyings output = (Varyings)0;

                output.positionCS =mul(UNITY_MATRIX_MVP,input.positionOS);   
                float3 norm = mul((float3x3)UNITY_MATRIX_IT_MV, input.normalOS);
                float2 extendDir = normalize(mul((float3x3)UNITY_MATRIX_P, norm.xy));

                output.positionCS.xy += extendDir * (output.positionCS.w * _Outline * 0.01);              
                output.color = _OutlineColor;
                output.fogCoord = ComputeFogFactor(output.positionCS.z);
                return output;
            }           
            
            half4 frag(Varyings i) : SV_Target
            {
                i.color.rgb = MixFog(i.color.rgb, i.fogCoord);
                return i.color;
            }
            ENDHLSL
        }
    }
}
