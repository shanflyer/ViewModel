Shader "Unlit/TestColor"
{
    Properties
    {
        _MainTex("_MainTex", 2D) = "white" {} 
       
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
		Blend SrcAlpha OneMinusSrcAlpha
        LOD 100

        Pass
        {
             HLSLPROGRAM
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            #pragma vertex vert
            #pragma fragment frag

            struct Attributes
            {
                float4 positionOS : POSITION;
                float3 normalOS : NORMAL;
                float2 uv:TEXCOORD0;
            };
            void Unity_Posterize_float4(float2 In, float Steps, out float2 Out)
                {
                    Out = floor(In / (1 / Steps)) * (1 / Steps);
                }
            struct Varyings
            {
                float4 positionCS : SV_POSITION;
                float2 uv:TEXCOORD0;
            };

            half _Contrast;
            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _Step;
             void Unity_Step_float(float Edge, float In, out float Out)
                {
                    Out = step(Edge, In);
                }
            Varyings vert (Attributes v)
            {
                Varyings o = (Varyings)0;

                VertexPositionInputs vertexInput = GetVertexPositionInputs(v.positionOS.xyz);
                o.positionCS = vertexInput.positionCS;
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            half4 frag (Varyings i) : SV_Target
            {                

                half4 col = tex2D(_MainTex, i.uv);
                float3 col3=float3(col[0],col[1],col[2]);
                float3 _col3=step(1,1-col3);
                half4 _col=half4(_col3,col.a);

                return _col;
                half3 avgColor = half3(0.5, 0.5, 0.5);
                //对比度
                half4 finalCol = col;
                //finalCol.rgb = lerp(avgColor, col, _Contrast);
                //float _a;
                //Unity_Step_float(1, finalCol.a, _a);
                //finalCol.w=_a;
                //finalCol.a=1;
                return finalCol;
            }
            ENDHLSL
        }
    }
}
