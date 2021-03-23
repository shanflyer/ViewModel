Shader "CommandBuffer/mosaic" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _PixelNumber ("PixelNum", Vector) = (100,100,0,0)
    }

    SubShader {
        Pass {
            Tags { 
                "RenderPipeline"="UniversalPipeline"
                "RenderType"="Transparent" }
                Blend SrcAlpha OneMinusSrcAlpha

            Stencil
            {
                Ref 2
                Comp Equal
            }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

             CBUFFER_START(UnityPerMaterial)
                sampler2D _MainTex;
                float2 _PixelNumber;
            CBUFFER_END

            

            struct v2f {
                half4 pos : POSITION;
                half2 uv : TEXCOORD0;
            };

            float4 _MainTex_ST;

            v2f vert(appdata_base v) {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
                o.uv =o.uv +float2(0.0006,0.0006);
                return o;
            }

            half4 frag(v2f i) : COLOR {
                half2 uv = floor(i.uv * _PixelNumber) / _PixelNumber;
                float4 col = tex2D(_MainTex, uv);
                


                return col;
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}