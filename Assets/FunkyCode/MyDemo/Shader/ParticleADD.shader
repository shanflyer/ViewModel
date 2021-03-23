Shader "Unlit/ParticleADD"
{
    Properties
    {
        _RefValue("Stencil RefValue",Int) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _Comp ("_Comp", Int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _Pass ("_Pass", Int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _Fail ("_Fail", Int) = 0
        _MainTex ("Texture", 2D) = "white" {}
        _Color("Color",Color)=(1,1,1,1)
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" "RenderType"="Transparent" }
        Blend SrcAlpha OneMinusSrcAlpha 
        Cull Off Lighting Off ZWrite Off
        LOD 100

        Stencil{
            Ref [_RefValue]
            Comp [_Comp] 
            Pass [_Pass]
            Fail [_Fail]
        }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float4 _Color;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = tex2D(_MainTex, i.uv)*_Color;
                //col.a=_Color.a;
                // apply fog
                return col;
            }
            ENDCG
        }
    }
}
