Shader "CommandBuffer/mosaic1" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _PixelNumber ("PixelNum", Vector) = (100,100,0,0)
        _IsMasaic("IsMasaic",float)=0
    }

    SubShader {
        Pass {
            Tags { 
                "RenderPipeline"="UniversalPipeline"
                "RenderType"="Opaque" }

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
                float _IsMasaic;
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
                return o;
            }

            half4 frag(v2f i) : COLOR {
                
                fixed4 col0 = tex2D(_MainTex, i.uv);
                if ( _IsMasaic > 0 ){
                    return col0;
                }
                
                half2 uv = floor(i.uv * _PixelNumber) / _PixelNumber;
                fixed4 col = tex2D(_MainTex, uv+float2(0.0003,0.0005));
                //return col;
                float4 _col=col;
                _col=step(1,1-_col);
                col0.a=step(0,col0.r);
                //return col0;
                //return _col;
                float4 colx=(1-_col)*col0;
                _col.r=_col.a;

                return colx;
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}