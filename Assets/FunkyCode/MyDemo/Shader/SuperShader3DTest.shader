Shader "SuperShader3DTest"
{
	Properties
	{
		_RefValue("RefValue",Int)=0	
		[Enum(UnityEngine.Rendering.CompareFunction)] _Comp ("_Comp", Int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _Pass ("_Pass", Int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _Fail ("_Fail", Int) = 0
		[Enum(Default,0,Character,1,Shadow,2,Plant,3,Water,4,Ponding,5,HighLight,6)] 
		ShaderType ("ShaderType", Int) = 2
		[Enum(Opaque,0,Transparent,1)] _Queue ("Queue", Int) = 2
		
		[Enum(Default,0,WaterCharacter,1,WaterShadow,2)] 
		CharacterType ("CharacterType", Int) = 0
        
		[Main(_Main, _, 2)] _Main ("Main", float) = 0
		[Sub(_Main)][TCP2HeaderHelp(Base)]
		[Sub(_Main)]_Color ("_Color", Color) = (1,1,1,1)
		[Sub(_Main)][TCP2ColorNoAlpha] _HColor ("Highlight Color", Color) = (0.75,0.75,0.75,1)
		[Sub(_Main)][TCP2ColorNoAlpha] _SColor ("Shadow Color", Color) = (0.2,0.2,0.2,1)
		[Sub(_Main)][NoScaleOffset] _ShadowColor ("Shadow Color", 2D) = "white" {}
		[Sub(_Main)]_BaseMap ("Albedo", 2D) = "white" {}

        [Sub(_Main)]_StandardColor0("_StandardColor0",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold0("_ColorThreshold0",float)=0.2 
		[Sub(_Main)]_StandardColor1("_StandardColor1",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold1("_ColorThreshold1",float)=0.2 
		[Sub(_Main)]_StandardColor2("_StandardColor2",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold2("_ColorThreshold2",float)=0.2 
		[Sub(_Main)]_StandardColor3("_StandardColor3",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold3("_ColorThreshold3",float)=0.2 
		[Sub(_Main)]_StandardColor4("_StandardColor4",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold4("_ColorThreshold4",float)=0.2 
		[Sub(_Main)]_StandardColor5("_StandardColor5",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold5("_ColorThreshold5",float)=0.2 
		[Sub(_Main)]_StandardColor6("_StandardColor6",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold6("_ColorThreshold6",float)=0.2 
		[Sub(_Main)]_StandardColor7("_StandardColor7",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold7("_ColorThreshold7",float)=0.2 
		[Sub(_Main)]_StandardColor8("_StandardColor8",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold8("_ColorThreshold8",float)=0.2 
		[Sub(_Main)]_StandardColor9("_StandardColor9",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold9("_ColorThreshold9",float)=0.2 
		[Sub(_Main)]_StandardColor10("_StandardColor10",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold10("_ColorThreshold10",float)=0.2 
		[Sub(_Main)]_StandardColor11("_StandardColor11",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold11("_ColorThreshold11",float)=0.2 
		[Sub(_Main)]_StandardColor12("_StandardColor12",Color)=(1,1,1,1)
		[Sub(_Main)]_ColorThreshold12("_ColorThreshold12",float)=0.2 

		



		[Sub(_Main)][TCP2Separator]

		[Sub(_Main)][TCP2Header(Ramp Shading)]
		
		[Sub(_Main)]_RampThreshold ("Main Light Threshold", Range(0.01,1)) = 0.5
		[Sub(_Main)]_RampSmoothing ("Main Light Smoothing", Range(0.001,1)) = 0.5
		
		[Sub(_Main)]_RampThresholdOtherLights ("Other Lights Threshold", Range(0.01,1)) = 0.5
		[Sub(_Main)]_RampSmoothingOtherLights ("Other Lights Smoothing", Range(0.001,1)) = 0.5
		[Sub(_Main)][Space]
		[Sub(_Main)][TCP2Separator]
		
		[Sub(_Main)][TCP2HeaderHelp(Rim Outline)]
		[Sub(_Main)][TCP2ColorNoAlpha] _RimColor ("Rim Color", Color) = (0.8,0.8,0.8,0.5)
		[Sub(_Main)]_RimMin ("Rim Min", Range(0,2)) = 0.5
		[Sub(_Main)]_RimMax ("Rim Max", Range(0,2)) = 1
		[Sub(_Main)][TCP2Separator]
		
		[Sub(_Main)][TCP2HeaderHelp(Sketch)]
		[Sub(_Main)]_SketchTexture ("Sketch Texture", 2D) = "black" {}
		[Sub(_Main)]_SketchTexture_OffsetSpeed ("Sketch Texture UV Offset Speed", Float) = 120
		[Sub(_Main)][TCP2ColorNoAlpha] _SketchColor ("Sketch Color", Color) = (0,0,0,1)

		[Main(_shadow, _, 2)] _shadow ("Shadow", float) = 0
		[Sub(_shadow)]_Zhight("ZHight",float)=0
		[Sub(_shadow)]_hight("ShadowPlaneHight",float)=0
		[Sub(_shadow)]_ShadowLight("ShadowLight",Vector)=(0,1,0,0)
		[Sub(_shadow)]_ShadowDirect("Shadow Direct",Vector) = (0,1,0,0)


		[Main(_plant, _, 2)] _plant ("Plant", float) = 0
		[Sub(_plant)]Rotate("Rotate", Range(-180, 180)) = 0
		[Sub(_plant)]WindDirection("WindDirection", Vector) = (2, 0, 0, 0)
		[Sub(_plant)]WindScale("WindScale", Float) = 1
		[Sub(_plant)]WindStrength("WindStrength", Float) = 0
		[Sub(_plant)]WindSpeed("WindSpeed", Float) = 0
		[Sub(_plant)]WindBase("WindBase", Range(-180, 180)) = 0
		[Sub(_plant)]WindInfluenceYPosition("WindInfluenceYPosition", Float) = 4
		[Sub(_plant)]NoiseScale("NoiseScale", Float) = 1
		[Sub(_plant)]MoveStrength("MoveStrength", Float) = 0.01
		[Sub(_plant)]MoveSpeed("MoveSpeed", Float) = 0
		[Sub(_plant)]MoveBase("MoveBase", Range(-180, 180)) = 0
		[Sub(_plant)]MoveInfluenceYPosition("MoveInfluenceYPosition", Float) = 4
		[Sub(_plant)]Size("Size", Vector) = (1, 1, 0, 0) 


		[Main(_water, _, 2)] _water ("Water", float) = 0
		[Sub(_water)][NoScaleOffset]_MaskTex("_MaskTex", 2D) = "white" {}
		[Sub(_water)]_Wave0("_Wave0", Vector) = (0, 0, 0, 0)
		[Sub(_water)]wave1("wave1", Vector) = (0, 0, 0, 0)
		[Sub(_water)][HDR]waterColor("waterColor", Color) = (0, 0.03999646, 0.8980392, 1)
		[Sub(_water)]waterValue("waterValue", Range(0, 0.4)) = 0.2
		[Sub(_water)]waterRange("waterRange", Range(-1, 1)) = 0
		[Sub(_water)]waveValue("waveValue", Float) = 1
		[Sub(_water)][NoScaleOffset]_WaveResult("_WaveResult", 2D) = "black" {} 
		[Sub(_water)]WaveScale0("WaveScale0", Vector) = (1, 1, 0, 0)
		[Sub(_water)]WaveScale1("WaveScale1", Vector) = (1, 1, 0, 0)
		[Sub(_water)][HDR]_WaveColor("WaveColor", Color) = (0.3066038, 1, 0.7005225, 0)
		[Sub(_water)][NoScaleOffset]_EdgeTex("_EdgeTex", 2D) = "black" {}
		[Sub(_water)][HDR]EdgeColor("EdgeColor", Color) = (0.990566, 0.9765486, 0.9765486, 0)
		[Sub(_water)]EdgeValue("EdgeValue", Float) = 26
		[Sub(_water)]PubuWaveScale("PubuWaveScale", Float) = 1
		[Sub(_water)]PuBuWave("PuBuWave", Vector) = (0, 0, 0, 0)
		[Sub(_water)][HDR]Pubu("Pubu", Color) = (0.9339623, 0.9207458, 0.9207458, 0)
		[Sub(_water)][NoScaleOffset]_WaveTex("_WaveTex", 2D) = "white" {}   

		[Main(_Ponging, _, 2)] _Ponging ("Ponging", float) = 0        
		[Sub(_Ponging)]_Range("_Range", Range(0, 1)) = 0.01
		[Sub(_Ponging)][NoScaleOffset]_PondingMaskTex("_PondingMaskTex", 2D) = "white" {}
		[Sub(_Ponging)]_MarginWidth("_MarginWidth", Range(0, 1)) = 0.12
		[Sub(_Ponging)]_PongingColor("_PongingColor", Color) = (0.2071467, 0.6644456, 0.8962264, 0.6235294)
		[Sub(_Ponging)][HDR]_HightLightColor("_HightLightColor", Color) = (1, 0.9969502, 0.4575472, 1)
		[Sub(_Ponging)]_WaterMarginColor("_WaterMarginColor", Color) = (0.6775098, 0.990566, 0.9109754, 1)
		[Sub(_Ponging)]_PongingOffer("_PongingOffer", Vector) = (0, 0, 0, 0)
		[Sub(_Ponging)]Vector1_985223B("_MaskRadio", Float) = 2
		[Sub(_Ponging)]_RangePower("_RangePower", Float) = 1
		[Sub(_Ponging)]_WaterMarginPower("_WaterMarginPower", Float) = 1  

		[Main(_HighLight, _, 2)] _HighLight ("HighLight", float) = 0
		[Sub(_HighLight)]_HighLightSize("_HighLightSize", Float) = 0.05
		[Sub(_HighLight)]_HighLightIntreval("_HighLightIntreval", Float) = 2
		[Sub(_HighLight)]_HighLightSpeed("_HighLightSpeed", Float) = 1
		[Sub(_HighLight)]_HighLightColor("_HighLightColor", Color) = (1, 0.9889738, 0.1745283, 0)
		[Sub(_HighLight)]_HighLightColorStrange("_HighLightColorStrange", Float) = 0.5
		[Sub(_HighLight)]_HightLightSwitch("_HightLightSwitch", Float) = 1
		[Sub(_HighLight)]_OutHightLightSize("_OutHightLightSize", Float) = 0.01
		[Sub(_HighLight)]_OutHightLightStrange("_OutHightLightStrange", Float) = 1
		[Sub(_HighLight)]_OutHightLightColor("_OutHightLightColor", Color) = (1, 0.674681, 0, 1)
		[Sub(_HighLight)]_OutHighLightIntreval("_OutHighLightIntreval", Float) = 1
		[Sub(_HighLight)]_OutHightLightSwitch("_OutHightLightSwitch", Float) = 1


		[Main(_WaterCharacter, _, 2)] _WaterCharacter ("WaterCharacter", float) = 0
		[Sub(_WaterCharacter)]_CWHight("Hight", Float) = 0.4
		[Sub(_WaterCharacter)]_CWStrange("Strange", Range(0, 2)) = 0.6
		[Sub(_WaterCharacter)]_CWWaveStrange("WaveStrange", Range(0, 2)) = 0.6
		[Sub(_WaterCharacter)]_CWSpeed("Speed", Float) = 0.03
		[Sub(_WaterCharacter)]_CWWidth("Width", Float) = 0.002
		[Sub(_WaterCharacter)]_CWWaveColor("WaveColor", Color) = (1, 1, 1, 1)
		[Sub(_WaterCharacter)]_CWWaterColor("WaterColor", Color) = (0, 0.6591742, 1, 1)
		[Sub(_WaterCharacter)]_WaterShadow_Alpha("_Alpha", Float) = 0.7



		//Avoid compile error if the properties are ending with a drawer
		[HideInInspector] __dummy__ ("unused", Float) = 0
	}

	SubShader
	{
		Tags { "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
		Blend SrcAlpha OneMinusSrcAlpha
		
		Stencil{
           Ref [_RefValue]
            Comp [_Comp] 
            Pass [_Pass]
            Fail [_Fail]
        }

		HLSLINCLUDE
		#define fixed half
		#define fixed2 half2
		#define fixed3 half3
		#define fixed4 half4

		#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
		#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
		
		
		// Uniforms

		// Shader Properties
		sampler2D _BaseMap;
		sampler2D _SketchTexture;
		sampler2D _ShadowColor;

		CBUFFER_START(UnityPerMaterial)

		float4 _StandardColor0;
		float4 _StandardColor1;
		float4 _StandardColor2;
		float4 _StandardColor3;
		float4 _StandardColor4;
		float4 _StandardColor5;
		float4 _StandardColor6;
		float4 _StandardColor7;
		float4 _StandardColor8;
		float4 _StandardColor9;
		float4 _StandardColor10;
		float4 _StandardColor11;
		float4 _StandardColor12;
		float _ColorThreshold0;
		float _ColorThreshold1;
		float _ColorThreshold2;
		float _ColorThreshold3;
		float _ColorThreshold4;
		float _ColorThreshold5;
		float _ColorThreshold6;
		float _ColorThreshold7;
		float _ColorThreshold8;
		float _ColorThreshold9;
		float _ColorThreshold10;
		float _ColorThreshold11;
		float _ColorThreshold12;
		
		float _hight;
		float _Zhight;
		float4 _ShadowLight;
		float4 _ShadowDirect;

		float Rotate;
		float2 WindDirection;
		float WindScale;
		float WindStrength;
		float WindSpeed;
		float WindBase;
		float WindInfluenceYPosition;
		float NoiseScale;
		float MoveStrength;
		float MoveSpeed;
		float MoveBase;
		float MoveInfluenceYPosition;
		float2 Size;
		//float4 Noise_TexelSize;

		float4 _MaskTex_TexelSize;
		float2 _Wave0;
		float2 wave1;
		float4 waterColor;
		float waterValue;
		float waterRange;
		float waveValue;
		float4 _WaveResult_TexelSize;
		float4 _Color;
		float2 WaveScale0;
		float2 WaveScale1;
		float4 _WaveColor;
		float4 _EdgeTex_TexelSize;
		float4 EdgeColor;
		float EdgeValue;
		float PubuWaveScale;
		float2 PuBuWave;
		float4 Pubu;
		float4 _WaveTex_TexelSize;


		float4 _PondingMaskTex_TexelSize;
		float _Range;
		float _MarginWidth;
		float4 _PongingColor;
		float4 _HightLightColor;
		float4 _WaterMarginColor;
		float2 _PongingOffer;
		float Vector1_985223B;
		float _RangePower;
		float _WaterMarginPower;


		float _HighLightSize;
		float _HighLightIntreval;
		float _HighLightSpeed;
		float4 _HighLightColor;
		float _HighLightColorStrange;
		float _HightLightSwitch;
		float _OutHightLightSize;
		float _OutHightLightStrange;
		float4 _OutHightLightColor;
		float _OutHighLightIntreval;
		float _OutHightLightSwitch;


		float _CWHight;
		float _CWStrange;
		float _CWWaveStrange;
		float _CWSpeed;
		float _CWWidth;
		float4 _CWWaterColor;
		float4 _CWWaveColor;		
		float _WaterShadow_Alpha;

		// Shader Properties
		int ShaderType;
		int CharacterType;
		float _OutlineWidth;
		fixed4 _OutlineColorVertex;
		float4 _BaseMap_ST;
		
		float _RampThreshold;
		float _RampSmoothing;
		fixed4 _SketchColor;
		float4 _SketchTexture_ST;
		float _SketchTexture_OffsetSpeed;
		fixed4 _SColor;
		fixed4 _HColor;
		float _RimMin;
		float _RimMax;
		fixed4 _RimColor;
		float _RampThresholdOtherLights;
		float _RampSmoothingOtherLights;
		CBUFFER_END

		// Object and Global properties
		
		TEXTURE2D(_MaskTex);
		SAMPLER(sampler_MaskTex);
		TEXTURE2D(_WaveResult);
		SAMPLER(sampler_WaveResult);
		TEXTURE2D(_EdgeTex);
		SAMPLER(sampler_EdgeTex);
		TEXTURE2D(_WaveTex);
		SAMPLER(sampler_WaveTex);

		TEXTURE2D(_PondingMaskTex);
		SAMPLER(sampler_PondingMaskTex);
		SAMPLER(_SampleTexture2D_1_Sampler_3_Linear_Repeat); 
		

		SAMPLER(_SampleTexture2D_Edge_Sampler_3_Linear_Repeat);
		SAMPLER(_SampleTexture2D_WaveTex_Sampler_3_Linear_Repeat); 
		SAMPLER(_SampleTexture2D_WaveResult_Sampler_3_Linear_Repeat);
		SAMPLER(_SampleTexture2D_MaskTex_Sampler_3_Linear_Repeat);

		
		//Get screen space UV with object offset taken into account
		inline float2 GetScreenUV(float2 clipPos)
		{
			float4x4 mvpMatrix = mul(unity_MatrixVP, unity_ObjectToWorld);
			float4 screenSpaceObjPos = float4(mvpMatrix[0][3],mvpMatrix[1][3],mvpMatrix[2][3],mvpMatrix[3][3]);
			float2 screenUV = clipPos.xy;
			screenUV.xy -= screenSpaceObjPos.xy / screenSpaceObjPos.ww;
			float ratio = _ScreenParams.x/_ScreenParams.y;
			screenUV.x *= ratio;
			screenUV *= screenSpaceObjPos.w;
			screenUV.x *= sign(UNITY_MATRIX_P[1].y); // 1 for Game View, -1 for Scene View
			return screenUV / UNITY_MATRIX_P._m11; // scale with the Camera FoV
		}
		
		// Hash without sin and uniform across platforms
		// Adapted from: https://www.shadertoy.com/view/4djSRW (c) 2014 - Dave Hoskins - CC BY-SA 4.0 License
		float2 hash22(float2 p)
		{
			float3 p3 = frac(p.xyx * float3(443.897, 441.423, 437.195));
			p3 += dot(p3, p3.yzx + 19.19);
			return frac((p3.xx+p3.yz)*p3.zy);
		}
		
		// Built-in renderer (CG) to SRP (HLSL) bindings
		#define UnityObjectToClipPos TransformObjectToHClip
		#define _WorldSpaceLightPos0 _MainLightPosition
		
		ENDHLSL

		
		Pass
		{
			Name "Main"
			Tags { "LightMode"="UniversalForward" }
			Blend SrcAlpha OneMinusSrcAlpha
			//Cull Off
			//ZWrite Off

			HLSLPROGRAM
			// Required to compile gles 2.0 with standard SRP library
			// All shaders must be compiled with HLSLcc and currently only gles is not using HLSLcc by default
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x
			#pragma target 3.0

			// -------------------------------------
			// Material keywords
			//#pragma shader_feature _ALPHATEST_ON
			#pragma shader_feature _ _RECEIVE_SHADOWS_OFF

			// -------------------------------------
			// Universal Render Pipeline keywords
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE

			// -------------------------------------
			// GPU Instancing
			#pragma multi_compile_instancing

			#pragma vertex Vertex
			#pragma fragment Fragment


			void Unity_Rotate_About_Axis_Degrees_float(float3 In, float3 Axis, float Rotation, out float3 Out)
			{
				Rotation = radians(Rotation);
				
				float s = sin(Rotation);
				float c = cos(Rotation);
				float one_minus_c = 1.0 - c;
				
				Axis = normalize(Axis);
				
				float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
					one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
					one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
				};
				
				Out = mul(rot_mat,  In);
			}			

			float2 Unity_GradientNoise_Dir_float(float2 p)
			{
				// Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
				p = p % 289;
				// need full precision, otherwise half overflows when p > 1
				float x = float(34 * p.x + 1) * p.x % 289 + p.y;
				x = (34 * x + 1) * x % 289;
				x = frac(x / 41) * 2 - 1;
				return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
			}
			float Unity_GradientNoise_float(float2 UV, float Scale)
			{ 
				float2 p = UV * Scale;
				float2 ip = floor(p);
				float2 fp = frac(p);
				float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
				float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
				float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
				float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
				fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
				return lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
				
			}
			void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
			{
				Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
			}
			void Unity_Remap_float4(float4 In, float2 InMinMax, float2 OutMinMax, out float4 Out)
			{
				Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
			}

			inline float Unity_SimpleNoise_RandomValue_float (float2 uv)
			{
				return frac(sin(dot(uv, float2(12.9898, 78.233)))*43758.5453);
			}
			
			inline float Unity_SimpleNnoise_Interpolate_float (float a, float b, float t)
			{
				return (1.0-t)*a + (t*b);
			}
			
			
			inline float Unity_SimpleNoise_ValueNoise_float (float2 uv)
			{
				float2 i = floor(uv);
				float2 f = frac(uv);
				f = f * f * (3.0 - 2.0 * f);
				
				uv = abs(frac(uv) - 0.5);
				float2 c0 = i + float2(0.0, 0.0);
				float2 c1 = i + float2(1.0, 0.0);
				float2 c2 = i + float2(0.0, 1.0);
				float2 c3 = i + float2(1.0, 1.0);
				float r0 = Unity_SimpleNoise_RandomValue_float(c0);
				float r1 = Unity_SimpleNoise_RandomValue_float(c1);
				float r2 = Unity_SimpleNoise_RandomValue_float(c2);
				float r3 = Unity_SimpleNoise_RandomValue_float(c3);
				
				float bottomOfGrid = Unity_SimpleNnoise_Interpolate_float(r0, r1, f.x);
				float topOfGrid = Unity_SimpleNnoise_Interpolate_float(r2, r3, f.x);
				float t = Unity_SimpleNnoise_Interpolate_float(bottomOfGrid, topOfGrid, f.y);
				return t;
			}
			void Unity_SimpleNoise_float(float2 UV, float Scale, out float Out)
			{
				float t = 0.0;
				
				float freq = pow(2.0, float(0));
				float amp = pow(0.5, float(3-0));
				t += Unity_SimpleNoise_ValueNoise_float(float2(UV.x*Scale/freq, UV.y*Scale/freq))*amp;
				
				freq = pow(2.0, float(1));
				amp = pow(0.5, float(3-1));
				t += Unity_SimpleNoise_ValueNoise_float(float2(UV.x*Scale/freq, UV.y*Scale/freq))*amp;
				
				freq = pow(2.0, float(2));
				amp = pow(0.5, float(3-2));
				t += Unity_SimpleNoise_ValueNoise_float(float2(UV.x*Scale/freq, UV.y*Scale/freq))*amp;
				
				Out = t;
			}
			void DecodeHeight_float(float4 rgba, out float height) {
				float2 kDecodeDot = float2(1.0, 1 / 255.0);
				float h1 =dot(rgba.rg, kDecodeDot);
				float h2 =dot(rgba.ba, kDecodeDot); 

				int c = step(h2, h1);
				height = lerp(h2, h1, c);
			}

			float3 StandardColorRevise(float3 baseColor,float3 standardColor,float colorThresHold){

				float3 color=baseColor-standardColor;
				float thresHold0=pow(color.r*color.r+color.g*color.g+color.b*color.b,0.5);
				//float thresHold0=abs(baseColor.r-standardColor.r)+abs(baseColor.g-standardColor.g)+abs(baseColor.b-standardColor.b);
				thresHold0=step(colorThresHold,thresHold0);

				return  1-thresHold0;
			}

			// vertex input
			struct Attributes
			{
				float4 vertex       : POSITION;
				float3 normal       : NORMAL;
				float4 tangent      : TANGENT;
				float4 texcoord0 : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			// vertex output / fragment input
			struct Varyings
			{
				float4 positionCS     : SV_POSITION; 
				float3 normal         : NORMAL;
				float4 worldPosAndFog : TEXCOORD0;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord    : TEXCOORD1; // compute shadow coord per-vertex for the main light
				#endif
				#ifdef _ADDITIONAL_LIGHTS_VERTEX
					half3 vertexLights : TEXCOORD2;
				#endif
				float4 clipPosition : TEXCOORD3;
				float2 pack1 : TEXCOORD4; /* pack1.xy = texcoord0 */
				float3 positionOS     : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};



			Varyings ShadowVertex(Attributes input)
			{
				Varyings output = (Varyings)0;
				output.positionOS=input.vertex;

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				// Texture Coordinates
				output.pack1.xy.xy = input.texcoord0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;

				VertexPositionInputs vertexInput = GetVertexPositionInputs(input.vertex.xyz);
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					output.shadowCoord = GetShadowCoord(vertexInput);
				#endif
				float4 clipPos = vertexInput.positionCS;
				
				//Screen Space UV
				output.clipPosition.xyzw = clipPos;

				VertexNormalInputs vertexNormalInput = GetVertexNormalInputs(input.normal);
				#ifdef _ADDITIONAL_LIGHTS_VERTEX
					// Vertex lighting
					output.vertexLights = VertexLighting(vertexInput.positionWS, vertexNormalInput.normalWS);
				#endif

				// world position
				output.worldPosAndFog = float4(vertexInput.positionWS.xyz, 0);

				// normal
				output.normal = NormalizeNormalPerVertex(vertexNormalInput.normalWS);

				// clip position
				//float3 pos = mul(unity_ObjectToWorld, input.vertex).xyz;

				float3 pos = mul(unity_ObjectToWorld, input.vertex).xyz;
				
				float3 dir = _ShadowLight.xyz;
				
				//基于任意平面投影


				float d0 = dot(- pos, -_ShadowDirect.xyz);
				float d1 = dot(-_ShadowDirect.xyz, dir);
				float3 dis = dir * (d0 / d1);
				//
				pos +=dis + _ShadowDirect.xyz * 0.01 * d0;


				float3 center = float3(unity_ObjectToWorld[0].w, unity_ObjectToWorld[1].w, unity_ObjectToWorld[2].w);
				pos+=float3(0,_hight,_Zhight);
				//output.worldPosAndFog = d0;
				output.positionCS = mul(unity_MatrixVP, float4(pos, 1.0));
				
				return output;
			}

			Varyings WaterCharacterVertex(Attributes input)
			{
				Varyings output = (Varyings)0;
				output.positionOS=input.vertex;

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);		

				

				// Texture Coordinates
				output.pack1.xy.xy = input.texcoord0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;


				float TimeSpeed = _Time.y * _CWSpeed;
				float2 NoiseUV1 = output.pack1.xy.xy + float2(TimeSpeed,0);
				float2 NoiseUV2 = output.pack1.xy.xy + float2(TimeSpeed,TimeSpeed);
				float Noise1 = Unity_GradientNoise_float(NoiseUV1,10);
				float Noise2 = Unity_GradientNoise_float(NoiseUV2,13.8);
				float Noise = (Noise1 * Noise2) / 100 * _CWStrange;
				float HighCut = step(input.vertex.x,-(_CWHight - 0.5));


				VertexPositionInputs vertexInput = GetVertexPositionInputs(input.vertex.xyz+ float3((lerp(0, 1, 1 - HighCut) * Noise).xx,0));

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					output.shadowCoord = GetShadowCoord(vertexInput);
				#endif
				float4 clipPos = vertexInput.positionCS;
				
				//Screen Space UV
				output.clipPosition.xyzw = clipPos;

				VertexNormalInputs vertexNormalInput = GetVertexNormalInputs(input.normal);
				#ifdef _ADDITIONAL_LIGHTS_VERTEX
					// Vertex lighting
					output.vertexLights = VertexLighting(vertexInput.positionWS, vertexNormalInput.normalWS);
				#endif

				// world position
				output.worldPosAndFog = float4(vertexInput.positionWS.xyz, 0);

				// normal
				output.normal = NormalizeNormalPerVertex(vertexNormalInput.normalWS);

				// clip position
				output.positionCS = vertexInput.positionCS;

				return output;
			}

		

			Varyings CharacterVertex(Attributes input)
			{
				Varyings output = (Varyings)0;
				output.positionOS=input.vertex;

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
				

				// Texture Coordinates
				output.pack1.xy.xy = input.texcoord0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;

				VertexPositionInputs vertexInput = GetVertexPositionInputs(input.vertex.xyz);
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					output.shadowCoord = GetShadowCoord(vertexInput);
				#endif
				float4 clipPos = vertexInput.positionCS;
				
				//Screen Space UV
				output.clipPosition.xyzw = clipPos;

				VertexNormalInputs vertexNormalInput = GetVertexNormalInputs(input.normal);
				#ifdef _ADDITIONAL_LIGHTS_VERTEX
					// Vertex lighting
					output.vertexLights = VertexLighting(vertexInput.positionWS, vertexNormalInput.normalWS);
				#endif

				// world position
				output.worldPosAndFog = float4(vertexInput.positionWS.xyz, 0);

				// normal
				output.normal = NormalizeNormalPerVertex(vertexNormalInput.normalWS);

				// clip position
				output.positionCS = vertexInput.positionCS;

				return output;
			}

			float3 PlantVertex(Attributes input)
			{
				


				float3 absoluteWorldSpacePosition =  GetAbsolutePositionWS(TransformObjectToWorld(input.vertex));

				////整体移动 

				//角度偏转            
				float3 _RotateAboutAxis_0_Out_3;
				Unity_Rotate_About_Axis_Degrees_float(input.vertex, float3 (0, 0, 1), MoveBase, _RotateAboutAxis_0_Out_3);  
				//尺寸校正       
				float2 _Multiply_0_Out_2=(_RotateAboutAxis_0_Out_3.xy)*Size;
				//position重定义并限制极值          
				float _Remap_0_Out_3;
				Unity_Remap_float(_Multiply_0_Out_2[1], float2 (-0.5, 1), float2 (0, 1), _Remap_0_Out_3);
				float _Clamp_0_Out_3=clamp(_Remap_0_Out_3, 0, 1);

				//运动基准点
				float _Power_0_Out_2=pow(_Clamp_0_Out_3, MoveInfluenceYPosition);
				float _Clamp_1_Out_3= clamp(_Power_0_Out_2, 0, 1);
				
				float2 _Vector2_1_Out_0 = float2(input.vertex.x, input.vertex.y);
				//运动值
				float _Multiply_1_Out_2=_TimeParameters.x*MoveSpeed; 

				//噪声运动
				float2 _TilingAndOffset_2_Out_3=_Vector2_1_Out_0*float2 (1, 1)+(_Multiply_1_Out_2.xx);
				            
				float _GradientNoise_2_Out_2=Unity_GradientNoise_float(_TilingAndOffset_2_Out_3, NoiseScale);
				float _Add_2_Out_2=_GradientNoise_2_Out_2-0.5;

				//运动与Y轴影响合成
				float2 _Multiply_3_Out_2=(_Clamp_1_Out_3.xx)*(_Add_2_Out_2.xx)*(MoveStrength.xx)*normalize(WindDirection); 
				float3 _Vector3_5_Out_0 = float3(_Multiply_3_Out_2[0], _Multiply_3_Out_2[1], 0);               
				
				

				////局部微动
				//运动值               

				float _Multiply_6_Out_2=_TimeParameters.x* WindSpeed;               
				
				float2 _Multiply_7_Out_2=(_Multiply_6_Out_2.xx)*WindDirection; 
				

				float2 _Vector2_5_Out_0 = float2(absoluteWorldSpacePosition.x, absoluteWorldSpacePosition.y);
				float2 _TilingAndOffset_7_Out_3=_Vector2_5_Out_0*float2 (1, 1)+_Multiply_7_Out_2;
				
				//噪声运动
				float _GradientNoise_7_Out_2=Unity_GradientNoise_float(_TilingAndOffset_7_Out_3, WindScale);
				float _Add_8_Out_2=_GradientNoise_7_Out_2-0.5;
				
				//风
				float _Multiply_8_Out_2=_Add_8_Out_2*WindStrength;                 
				float2 _Multiply_9_Out_2=(_Multiply_8_Out_2.xx)* WindDirection;               

				//角度偏转  
				float3 _RotateAboutAxis_10_Out_3;
				Unity_Rotate_About_Axis_Degrees_float(input.vertex, float3 (0, 0, 1), WindBase, _RotateAboutAxis_10_Out_3);
				//尺寸修正
				float2 _Multiply_10_Out_2=(_RotateAboutAxis_10_Out_3.xy)*Size;
				//position重定义并限制极值  
				float _Remap_10_Out_3;
				Unity_Remap_float(_Multiply_10_Out_2[1], float2 (-0.5, 1), float2 (0, 1), _Remap_10_Out_3);
				float _Clamp_10_Out_3=clamp(_Remap_10_Out_3, 0, 1);
				//运动基准点
				float _Power_11_Out_2=pow(_Clamp_10_Out_3, WindInfluenceYPosition);
				float _Clamp_11_Out_3=clamp(_Power_11_Out_2, 0, 1); 
				//微动合成
				float2 _Multiply_12_Out_2=_Multiply_9_Out_2*(_Clamp_11_Out_3.xx);        
				float3 _Vector3_12_Out_0 = float3(_Multiply_12_Out_2[0], _Multiply_12_Out_2[1], 0);

				////整体运动与局部运动合成
				float3 _Add_12_Out_2=_Vector3_5_Out_0+ _Vector3_12_Out_0;               
				return _Add_12_Out_2;
			}		
			
			Varyings Vertex(Attributes input)
			{
				Varyings output = (Varyings)0;
				switch(ShaderType){			
					case 1:
					switch(CharacterType){
						case 0:
						output=CharacterVertex(input);
						break;
						case 1:
						output=WaterCharacterVertex(input);
						break;
						case 2:
						output=WaterCharacterVertex(input);
						break;

					}
					break;		
					case 2:
					output=ShadowVertex(input);
					break;
					case 3:
					output=CharacterVertex(input);
					output.positionCS+=float4(PlantVertex(input),0);
					break;
				
					default:
					output=CharacterVertex(input);
					break;
				}				

				return output;
			}

			float4 PondingFragment(Varyings input)
			{
				float4 _SampleTexture2D_0_RGBA_0 = tex2D(_BaseMap, input.pack1.xy.xy).rgba;
				
				float2 _Divide_0_Out_2=_PongingOffer/float2(100, 100); 
				float2 _TilingAndOffset_0_Out_3=input.pack1.xy.xy*float2 (1, 1)+_Divide_0_Out_2; 
				float4 _SampleTexture2D_1_RGBA_0 = SAMPLE_TEXTURE2D(_PondingMaskTex, sampler_PondingMaskTex, _TilingAndOffset_0_Out_3);
				
				float _Multiply_1_Out_2= _Range* _RangePower; 
				float _Subtract_1_Out_2=_SampleTexture2D_1_RGBA_0.r- _Multiply_1_Out_2; 
				
				float _Multiply_3_Out_2=_Subtract_1_Out_2*_SampleTexture2D_1_RGBA_0.b; 
				float _Clamp_4_Out_3=clamp(_Multiply_3_Out_2, 0, 1); 
				float4 _Multiply_4_Out_2=_HightLightColor*(_Clamp_4_Out_3.xxxx); 
				
				float _Multiply_5_Out_2=_Subtract_1_Out_2*Vector1_985223B; 
				float _Clamp_5_Out_3=clamp(_Multiply_5_Out_2, 0, 1); 
				float _Subtract_5_Out_2=_Clamp_5_Out_3-_Clamp_4_Out_3; 
				
				float4 _Multiply_6_Out_2=(_Subtract_5_Out_2.xxxx)* _PongingColor; 
				float4 _Add_6_Out_2=_Multiply_4_Out_2+_Multiply_6_Out_2; 
				
				float _Step_6_Out_2=step(0.03, _Subtract_1_Out_2);
				
				float _Subtract_6_Out_2=_Subtract_1_Out_2- _MarginWidth;
				float _Step_7_Out_2=step(0, _Subtract_6_Out_2);
				float _Subtract_7_Out_2=_Step_6_Out_2- _Step_7_Out_2;
				float _Multiply_7_Out_2=_Multiply_5_Out_2*_Subtract_7_Out_2;
				float _Step_8_Out_2=step(0.001, _Multiply_7_Out_2);
				float _Multiply_8_Out_2=_WaterMarginPower*_Step_8_Out_2; 
				float4 _Multiply_9_Out_2=_WaterMarginColor*(_Multiply_8_Out_2.xxxx); 
				float4 _Add_9_Out_2=_SampleTexture2D_0_RGBA_0+ _Add_6_Out_2+_Multiply_9_Out_2;
				
				return _Add_9_Out_2;
			}

			float4 HighLightFragment(Varyings input)
			{ 

				float4 _SampleTexture2D_0_RGBA_0 = tex2D(_BaseMap, input.pack1.xy.xy).rgba;
				
				float2 _Vector2_0_Out_0 = float2(_OutHightLightSize, 0);
				float2 _TilingAndOffset_0_Out_3=input.pack1.xy.xy*float2 (1, 1)+_Vector2_0_Out_0; 
				float4 _SampleTexture2D_1_RGBA_0 =tex2D(_BaseMap, _TilingAndOffset_0_Out_3).rgba;
				
				float _Step_1_Out_2=step(0.8, _SampleTexture2D_1_RGBA_0.a); 
				float _Multiply_1_Out_2=_OutHightLightSize*-1; 
				float2 _Vector2_1_Out_0 = float2(_Multiply_1_Out_2, 0);
				float2 _TilingAndOffset_1_Out_3=input.pack1.xyxy*float2 (1, 1)+_Vector2_1_Out_0; 
				float4 _SampleTexture2D_2_RGBA_0 = tex2D(_BaseMap, _TilingAndOffset_1_Out_3).rgba;
				
				float _Step_2_Out_2=step(0.8, _SampleTexture2D_2_RGBA_0.a); 
				float _Add_2_Out_2=_Step_1_Out_2+_Step_2_Out_2; 
				float2 _Vector2_2_Out_0 = float2(0, _OutHightLightSize);
				float2 _TilingAndOffset_2_Out_3=input.pack1.xy.xy*float2 (1, 1)+_Vector2_2_Out_0; 
				float4 _SampleTexture2D_3_RGBA_0 = tex2D(_BaseMap, _TilingAndOffset_2_Out_3).rgba;
				
				float _Step_3Out_2=step(0.8, _SampleTexture2D_3_RGBA_0.a); 
				float2 _Vector2_3_Out_0 = float2(0, _Multiply_1_Out_2);
				float2 _TilingAndOffset_3_Out_3=input.pack1.xy.xy*float2 (1, 1)+_Vector2_3_Out_0; 
				float4 _SampleTexture2D_4_RGBA_0 = tex2D(_BaseMap, _TilingAndOffset_3_Out_3).rgba;
				
				float _Step_4_Out_2=step(0.8, _SampleTexture2D_4_RGBA_0.a); 
				float _Add_4_Out_2=_Step_3Out_2+_Step_4_Out_2; 
				float _Add_5_Out_2=_Add_2_Out_2+ _Add_4_Out_2; 
				float _Clamp_5_Out_3=clamp(_Add_5_Out_2, 0, 1); 
				float _Step_6_Out_2=step(0.8, _Clamp_5_Out_3); 
				float _Subtract_6_Out_2=_Step_6_Out_2-_SampleTexture2D_0_RGBA_0.a; 
				float _Clamp_6_Out_3=clamp(_Subtract_6_Out_2, 0, 1); 
				float4 _Multiply_6_Out_2=_OutHightLightColor*(_Clamp_6_Out_3.xxxx); 
				
				float _Multiply_7_Out_2=_OutHighLightIntreval*_TimeParameters.x; 
				float _Sine_7_Out_1= sin(_Multiply_7_Out_2); 
				float _Add_7_Out_2=_Sine_7_Out_1+ 1; 
				float _Divide_7_Out_2=_Add_7_Out_2/2; 
				float4 _Multiply_8_Out_2=_Multiply_6_Out_2*(_Divide_7_Out_2.xxxx); 
				float4 _Multiply_9_Out_2=(_OutHightLightStrange.xxxx)*_Multiply_8_Out_2; 
				float4 _Multiply_10_Out_2=(_OutHightLightSwitch.xxxx)* _Multiply_9_Out_2; 
				
				float _Add_10Out_2=_SampleTexture2D_0_RGBA_0.a+_Multiply_10_Out_2[3];
				
				float3 _Add_11_Out_2=input.positionOS+(0.5.xxx); 
				float3 _Clamp_11_Out_3=clamp(_Add_11_Out_2,0,1);               
				
				float _Add_12_Out_2=_Clamp_11_Out_3[0]+ _Clamp_11_Out_3[1];                 
				float _Multiply_12_Out_2=_TimeParameters.x*_HighLightSpeed; 
				
				float _Modulo_12_Out_2=fmod(_Multiply_12_Out_2, _HighLightIntreval); 
				
				float _Subtract_12_Out_2=_Modulo_12_Out_2- _HighLightSize;
				float _Step_12_Out_2=step(_Add_12_Out_2, _Subtract_12_Out_2); 
				float _OneMinus_12_Out_1=1-_Step_12_Out_2;
				
				float _Add_13_Out_2=_Modulo_12_Out_2+_HighLightSize; 
				float _Step_13_Out_2=step(_Add_12_Out_2, _Add_13_Out_2); 
				float _Multiply_13_Out_2=_OneMinus_12_Out_1*_Step_13_Out_2; 
				float _Multiply_134_Out_2=_Step_6_Out_2*_Multiply_13_Out_2; 
				float4 _Multiply_15_Out_2=_HighLightColor*(_Multiply_134_Out_2.xxxx); 
				
				float4 _Multiply_16_Out_2=_Multiply_15_Out_2* (_HighLightColorStrange.xxxx); 
				float4 _Multiply_17_Out_2=(_HightLightSwitch.xxxx)* _Multiply_16_Out_2; 
				float4 _Add_17_Out_2=_Multiply_17_Out_2+_Multiply_10_Out_2; 
				float4 _Add_18_Out_2= _SampleTexture2D_0_RGBA_0+_Add_17_Out_2; 
				float4 _Multiply_18_Out_2=(_Add_10Out_2.xxxx)* _Add_18_Out_2; 
				return _Multiply_18_Out_2;
			}


			float4 WaterFragment(Varyings input)
			{
				//边缘
				float2 _TilingAndOffset_0_Out_3=input.pack1.xy.xy * float2 (1, 1) + float2 (0, 0);
				float4 _SampleTexture2D_Edge_RGBA_0 = SAMPLE_TEXTURE2D(_EdgeTex, sampler_EdgeTex, _TilingAndOffset_0_Out_3); 
				float4 _SampleTexture2D_Edge_True=_SampleTexture2D_Edge_RGBA_0*(_SampleTexture2D_Edge_RGBA_0.a.xxxx);                     
				
				float _Divide_0_Out_2=waterValue/0.4;                 

				//波纹1
				float2 _Multiply_2_Out_2=(_TimeParameters.x.xx)*_Wave0; 
				float2 _TilingAndOffset_2_Out_3=input.pack1.xy.xy*WaveScale0+_Multiply_2_Out_2; 
				float4 _SampleTexture2D_WaveTex_RGBA_0 = SAMPLE_TEXTURE2D(_WaveTex, sampler_WaveTex, _TilingAndOffset_2_Out_3);
				_SampleTexture2D_WaveTex_RGBA_0.rgb = UnpackNormal(_SampleTexture2D_WaveTex_RGBA_0);
				
				//波纹2
				float2 _Multiply_3_Out_2=(_TimeParameters.x.xx)*wave1;
				
				float2 _TilingAndOffset_3_Out_3=input.pack1.xy.xy*WaveScale1+_Multiply_3_Out_2; 
				float4 _SampleTexture2D_WaveTex1_RGBA_0 = SAMPLE_TEXTURE2D(_WaveTex, sampler_WaveTex, _TilingAndOffset_3_Out_3);
				_SampleTexture2D_WaveTex1_RGBA_0.rgb = UnpackNormal(_SampleTexture2D_WaveTex1_RGBA_0);
				
				//波纹叠加
				float4 _Add_3_Out_2=_SampleTexture2D_WaveTex_RGBA_0+_SampleTexture2D_WaveTex1_RGBA_0;
				
				//波纹叠加噪声
				float4 _Multiply_4_Out_2=(_Divide_0_Out_2.xxxx)*_Add_3_Out_2;
				
				//波纹r、g叠加
				float _Add_4_Out_2=_Multiply_4_Out_2[0]+_Multiply_4_Out_2[1]; 

				//波纹与边缘混合
				float4 _Multiply_51_Out_2=_SampleTexture2D_Edge_True*(_Add_4_Out_2.xxxx);
				
				float4 _Clamp_5_Out_3=clamp(_Multiply_51_Out_2, 0, 1);                    
				float4 _Multiply_61_Out_2=EdgeColor*_Clamp_5_Out_3;                   
				
				float2 _Vector2_4_Out_0 = float2(0, EdgeValue);
				float4 _Remap_4_Out_3;
				Unity_Remap_float4(_Multiply_61_Out_2, float2 (0, 1), _Vector2_4_Out_0, _Remap_4_Out_3);
				

				//主颜色
				float4 _Multiply_5_Out_2=_Color*(_Color[3].xxxx);
				
				float4 _SampleTexture2D_MainTex_RGBA_0 = tex2D(_BaseMap, input.pack1.xy.xy).rgba;
				
				float4 _Multiply_6_Out_2=_Multiply_5_Out_2*(_SampleTexture2D_MainTex_RGBA_0.a.xxxx);
				
				float _OneMinus_6_Out_1=1-_Color[3];
				float4 _Multiply_7_Out_2=(_OneMinus_6_Out_1.xxxx)*_SampleTexture2D_MainTex_RGBA_0;
				
				float4 _Add_7_Out_2=_Multiply_6_Out_2+_Multiply_7_Out_2;
				
				//噪声
				float _SimpleNoise_7_Out_2;
				Unity_SimpleNoise_float(input.pack1.xy.xy, 24.1, _SimpleNoise_7_Out_2);
				
				float2 _Vector2_7_Out_0 = float2(waterRange, 1);
				float _Remap_7_Out_3;
				Unity_Remap_float(_SimpleNoise_7_Out_2, _Vector2_7_Out_0, float2 (0, 1), _Remap_7_Out_3);
				float _Clamp_7_Out_3=clamp(_Remap_7_Out_3, 0, waterValue);
				float _Multiply_8_Out_2=_Clamp_7_Out_3* _Add_4_Out_2*waterColor;
				
				float _Remap_9_Out_3;
				Unity_Remap_float(_Multiply_8_Out_2, float2 (0, 1), float2 (-0.04, 1), _Remap_9_Out_3);
				float _Clamp_9_Out_3=clamp(_Remap_9_Out_3, 0, 1);
				float _Multiply_10_Out_2=waveValue*_Clamp_9_Out_3;
				
				float4 _Add_10_Out_2=_Multiply_8_Out_2+(_Multiply_10_Out_2.xxxx);
				
				//波浪Mask
				float4 _SampleTexture2D_WaveResult_RGBA_0 = SAMPLE_TEXTURE2D(_WaveResult, sampler_WaveResult, input.pack1.xy.xy);
				
				float _CustomFunction_10_Height_1;
				DecodeHeight_float(_SampleTexture2D_WaveResult_RGBA_0, _CustomFunction_10_Height_1);
				
				float4 _Multiply_11_Out_2=(_CustomFunction_10_Height_1.xxxx)*_WaveColor;
				
				float4 _Clamp_11_Out_3=clamp(_Multiply_11_Out_2,0,1);

				//
				float4 _Add_11_Out_2=_Add_10_Out_2+ _Clamp_11_Out_3;
				//a值
				float4 _Multiply_12_Out_2=(_SampleTexture2D_MainTex_RGBA_0.a.xxxx)* _Add_11_Out_2;
				
				
				//瀑布
				float2 _Multiply_112_Out_2=(_TimeParameters.x.xx)* PuBuWave; 
				float2 _TilingAndOffset_12_Out_3=input.pack1.xy.xy*(PubuWaveScale.xx)+_Multiply_112_Out_2;
				
				float4 _SampleTexture2D_WaveTex2_RGBA_0 = SAMPLE_TEXTURE2D(_WaveTex, sampler_WaveTex, _TilingAndOffset_12_Out_3);
				_SampleTexture2D_WaveTex2_RGBA_0.rgb = UnpackNormal(_SampleTexture2D_WaveTex2_RGBA_0);
				
				
				float _Remap_12_Out_3;
				Unity_Remap_float(input.pack1.xy[1], float2 (0, 1), float2 (1, -0.51), _Remap_12_Out_3);
				float _Clamp_12_Out_3=clamp(_Remap_12_Out_3, 0, 1);
				float4 _Multiply_13_Out_2=_SampleTexture2D_WaveTex2_RGBA_0*(_Clamp_12_Out_3.xxxx);
				
				
				float _Add_13_Out_2=_Multiply_13_Out_2[0]+ _Multiply_13_Out_2[1]; 
				float4 _Multiply_14_Out_2=Pubu*(_Add_13_Out_2.xxxx)*Pubu[3].xxxx; 
				//瀑布叠加波纹、主颜色
				float4 _Add_15_Out_2=(_Remap_4_Out_3[0].xxxx)+_Add_7_Out_2+ _Multiply_12_Out_2+_Multiply_14_Out_2; 
				
				
				return _Add_15_Out_2;
			}

			half4 DefaultFragment(Varyings input, half vFace : VFACE) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				float3 positionWS = input.worldPosAndFog.xyz;
				float3 normalWS = NormalizeNormalPerPixel(input.normal);
				normalWS.z *= (vFace < 0) ? -1.0 : 1.0;
				half3 viewDirWS = SafeNormalize(GetCameraPositionWS() - positionWS);

				//Screen Space UV
				float2 screenUV = GetScreenUV(input.clipPosition.xyzw.xy / input.clipPosition.xyzw.w);
				// Shader Properties Sampling
				float4 _albedo = ( tex2D(_BaseMap, input.pack1.xy.xy).rgba );				
				_albedo =  _albedo * _Color;
				_albedo.a=	_albedo.a*_Color.a;			

				return _albedo;
			}


			half4 CharacterFragment(Varyings input, half vFace : VFACE) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				float3 positionWS = input.worldPosAndFog.xyz;
				float3 normalWS = NormalizeNormalPerPixel(input.normal);
				normalWS.z *= (vFace < 0) ? -1.0 : 1.0;
				half3 viewDirWS = SafeNormalize(GetCameraPositionWS() - positionWS);

				//Screen Space UV
				float2 screenUV = GetScreenUV(input.clipPosition.xyzw.xy / input.clipPosition.xyzw.w);
				// Shader Properties Sampling
				float4 __albedo = ( tex2D(_BaseMap, input.pack1.xy.xy).rgba );
				float4 __mainColor = ( _Color.rgba );
				float __alpha = ( __albedo.a * __mainColor.a );
				float __ambientIntensity = ( 1.0 );
				float __rampThreshold = ( _RampThreshold );
				float __rampSmoothing = ( _RampSmoothing );
				float3 __sketchColor = ( _SketchColor.rgb );
				float3 __sketchTexture = ( tex2D(_SketchTexture, screenUV * _ScreenParams.zw * _SketchTexture_ST.xy + _SketchTexture_ST.zw + hash22(floor(_Time.xx * _SketchTexture_OffsetSpeed.xx) / _SketchTexture_OffsetSpeed.xx)).aaa );
				float __sketchThresholdScale = ( 1.0 );
				float3 __shadowColor = ( _SColor.rgb * tex2D(_ShadowColor, input.pack1.xy.xy).rgb );
				float3 __highlightColor = ( _HColor.rgb );
				float __rimMin = ( _RimMin );
				float __rimMax = ( _RimMax );
				float3 __rimColor = ( _RimColor.rgb );
				float __rimStrength = ( 1.0 );
				float __rampThresholdOtherLights = ( _RampThresholdOtherLights );
				float __rampSmoothingOtherLights = ( _RampSmoothingOtherLights );

				half ndv = max(0, dot(viewDirWS, normalWS));
				half ndvRaw = ndv;

				// main texture
				half3 albedo = __albedo.rgb;
				half alpha = __alpha;
				half3 emission = half3(0,0,0);


				
				/*
				float3 color2=StandardColorRevise(albedo,_StandardColor2,_ColorThreshold2);
				float3 color3=StandardColorRevise(albedo,_StandardColor3,_ColorThreshold3);
				float3 color4=StandardColorRevise(albedo,_StandardColor4,_ColorThreshold4);
				float3 color5=StandardColorRevise(albedo,_StandardColor5,_ColorThreshold5);
				float3 color6=StandardColorRevise(albedo,_StandardColor6,_ColorThreshold6);
				float3 color7=StandardColorRevise(albedo,_StandardColor7,_ColorThreshold7);
				float3 color8=StandardColorRevise(albedo,_StandardColor8,_ColorThreshold8);
				albedo=albedo+color0+color1+color2+color3+color4+color5+color6+color7+color8;
				*/


				
				albedo *= __mainColor.rgb;

				// main light: direction, color, distanceAttenuation, shadowAttenuation
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord = input.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					float4 shadowCoord = TransformWorldToShadowCoord(positionWS);
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif
				Light mainLight = GetMainLight(shadowCoord);

				// ambient or lightmap
				// Samples SH fully per-pixel. SampleSHVertex and SampleSHPixel functions
				// are also defined in case you want to sample some terms per-vertex.
				half3 bakedGI = SampleSH(normalWS);
				half occlusion = 1;
				half3 indirectDiffuse = bakedGI;
				indirectDiffuse *= occlusion * albedo * __ambientIntensity;

				half3 lightDir = mainLight.direction;
				half3 lightColor = mainLight.color.rgb;

				half atten = mainLight.shadowAttenuation * mainLight.distanceAttenuation;

				half ndl = dot(normalWS, lightDir);
				half3 ramp;
				
				half rampThreshold = __rampThreshold;
				half rampSmooth = __rampSmoothing * 0.5;
				ndl = saturate(ndl);
				ramp = smoothstep(rampThreshold - rampSmooth, rampThreshold + rampSmooth, ndl);

				// apply attenuation
				ramp *= atten;

				half3 sketchColor = lerp(__sketchColor, half3(1,1,1), __sketchTexture);
				half3 sketch = lerp(sketchColor, half3(1,1,1), saturate(ramp * __sketchThresholdScale));

				// highlight/shadow colors
				albedo = lerp(__shadowColor, albedo, ramp);
				ramp = lerp(half3(1,1,1), __highlightColor, ramp);
				
				// output color
				half3 color = half3(0,0,0);
				// Rim Outline
				half rim = 1 - ndvRaw;
				rim = ( rim );
				half rimMin = __rimMin;
				half rimMax = __rimMax;
				rim = smoothstep(rimMin, rimMax, rim);
				half3 rimColor = __rimColor;
				half rimStrength = __rimStrength;
				albedo.rgb = lerp(albedo.rgb, rimColor, rim * rimStrength);
				color += albedo * lightColor.rgb * ramp;
				color.rgb *= sketch;

				// Additional lights loop
				#ifdef _ADDITIONAL_LIGHTS
					uint additionalLightsCount = GetAdditionalLightsCount();
					for (uint lightIndex = 0u; lightIndex < additionalLightsCount; ++lightIndex)
					{
						Light light = GetAdditionalLight(lightIndex, positionWS);
						half atten = light.shadowAttenuation * light.distanceAttenuation;
						half3 lightDir = light.direction;
						half3 lightColor = light.color.rgb;

						half ndl = dot(normalWS, lightDir);
						half3 ramp;
						
						half rampThreshold = __rampThresholdOtherLights;
						half rampSmooth = __rampSmoothingOtherLights * 0.5;
						ndl = saturate(ndl);
						ramp = smoothstep(rampThreshold - rampSmooth, rampThreshold + rampSmooth, ndl);

						// apply attenuation (shadowmaps & point/spot lights attenuation)
						ramp *= atten;

						// apply highlight color
						ramp = lerp(half3(0,0,0), __highlightColor, ramp);
						
						// output color
						color += albedo * lightColor.rgb * ramp;

					}
				#endif
				#ifdef _ADDITIONAL_LIGHTS_VERTEX
					color += input.vertexLights * albedo;
				#endif

				// apply ambient
				color += indirectDiffuse;

				color += emission;
				//float3 value=float3(0,0,0,1);

				float3 value=StandardColorRevise(color,_StandardColor0,_ColorThreshold0);
                float3 color0=_StandardColor0*value;
			

				color=color*(1-value);


				

				

				float3 value1=StandardColorRevise(color,_StandardColor1,_ColorThreshold1)*(1-value);
				float3 color1=_StandardColor1*value1;
				value+=value1;
				color=color*(1-value);

				float3 value2=StandardColorRevise(color,_StandardColor2,_ColorThreshold2)*(1-value);
				float3 color2=_StandardColor2*value2;
				value+=value2;
				color=color*(1-value);
				//return half4(value2, alpha);

				float3 value3=StandardColorRevise(color,_StandardColor3,_ColorThreshold3)*(1-value);
				float3 color3=_StandardColor3*value3;
				value+=value3;
				color=color*(1-value);
				

				float3 value4=StandardColorRevise(color,_StandardColor4,_ColorThreshold4)*(1-value);
				float3 color4=_StandardColor4*value4;
				value+=value4;
				color=color*(1-value);				

				float3 value5=StandardColorRevise(color,_StandardColor5,_ColorThreshold5)*(1-value);
				float3 color5=_StandardColor5*value5;
				value+=value5;
				color=color*(1-value);

				float3 value6=StandardColorRevise(color,_StandardColor6,_ColorThreshold6)*(1-value);
				float3 color6=_StandardColor6*value6;
				value+=value6;
				color=color*(1-value);

				float3 value7=StandardColorRevise(color,_StandardColor7,_ColorThreshold7)*(1-value);
				float3 color7=_StandardColor7*value7;
				value+=value7;
				color=color*(1-value);

				float3 value8=StandardColorRevise(color,_StandardColor8,_ColorThreshold8)*(1-value);
				float3 color8=_StandardColor8*value8;
				value+=value8;
				color=color*(1-value);
				//return float4(color,1);

				float3 value9=StandardColorRevise(color,_StandardColor9,_ColorThreshold9)*(1-value);
				float3 color9=_StandardColor9*value9;
				value+=value9;
				color=color*(1-value);

				float3 value10=StandardColorRevise(color,_StandardColor10,_ColorThreshold10)*(1-value);
				float3 color10=_StandardColor10*value10;
				value+=value10;
				color=color*(1-value);

				float3 value11=StandardColorRevise(color,_StandardColor11,_ColorThreshold11)*(1-value);
				float3 color11=_StandardColor11*value11;
				value+=value11;
				color=color*(1-value);

				float3 value12=StandardColorRevise(color,_StandardColor12,_ColorThreshold12)*(1-value);
				float3 color12=_StandardColor12*value12;
				value+=value12;
				color=color*(1-value);

				color=color0+color1+color2+color3+color4+color5+color6+color7+color8+color9+color10+color11+color12;

				//float3 color1=StandardColorRevise(albedo,_StandardColor1,_ColorThreshold1);

               


				return half4(color, alpha);
			}

			half4 WaterCharacterFragment(Varyings input, half vFace : VFACE) : SV_Target
			{
				float4 MainTex=CharacterFragment(input,vFace);
				float4 waterMain = MainTex * _CWWaterColor;

				int HighCut = step(input.positionOS.x,-(_CWHight - 0.5));

				float TimeSpeed = _Time.y * _CWSpeed;
				float2 NoiseUV1 = input.pack1.xy.xy + float2(TimeSpeed,0);
				float2 NoiseUV2 = input.pack1.xy.xy + float2(TimeSpeed,TimeSpeed);
				float Noise1 = Unity_GradientNoise_float(NoiseUV1,10);
				float Noise2 = Unity_GradientNoise_float(NoiseUV2,13.8);
				float Noise = (Noise1 * Noise2) * _CWWaveStrange;
				
				float4 outputMainTex = lerp(waterMain,MainTex,HighCut);
				float4 whiteBlend = lerp(outputMainTex, _CWWaveColor, 4);
				float widthModel = clamp(1 - (abs(input.positionOS.x + (_CWHight - 0.5)) * (1 / _CWWidth)),0,1);
				return lerp(outputMainTex,whiteBlend,widthModel * Noise);				
			}

			half4 WaterShadowFragment(Varyings input, half vFace : VFACE) : SV_Target
			{
				float4 MainTex=CharacterFragment(input,vFace);
				float4 waterMain = MainTex * _CWWaterColor;

				int HighCut = step(input.positionOS.x,-(_CWHight - 0.5));

				float TimeSpeed = _Time.y * _CWSpeed;
				float2 NoiseUV1 = input.pack1.xy.xy + float2(TimeSpeed,0);
				float2 NoiseUV2 = input.pack1.xy.xy + float2(TimeSpeed,TimeSpeed);
				float Noise1 = Unity_GradientNoise_float(NoiseUV1,10);
				float Noise2 = Unity_GradientNoise_float(NoiseUV2,13.8);
				float Noise = (Noise1 * Noise2) * _CWWaveStrange;
				
				float4 color = lerp(waterMain,MainTex,1 - HighCut);
				color.a = HighCut * _WaterShadow_Alpha;
				return color;				
			}




			half4 Fragment(Varyings input, half vFace : VFACE) : SV_Target
			{
				half4 color=_Color;
				switch(ShaderType){
					
					case 1:
					switch(CharacterType){
						case 0:
						color=CharacterFragment(input,vFace);
						break;
						case 1:
						color=WaterCharacterFragment(input,vFace);	
						break;
						case 2:
						color=WaterShadowFragment(input,vFace);	
						break;

					}					
					break;
					case 2:
					color=_Color;
					break;
					case 4:
					color=WaterFragment(input);
					break;
					case 5:
					color=PondingFragment(input);
					break;
					case 6:
					color=HighLightFragment(input);
					break;				
					default:
					color=DefaultFragment(input,vFace);
					break;
					
				}
				

				return color;
			}
			ENDHLSL
		}

		
		
		// Depth prepass
		// UsePass "Universal Render Pipeline/Lit/DepthOnly"

	}

	FallBack "Hidden/InternalErrorShader"
	CustomEditor "ToonyColorsPro.ShaderGenerator.MaterialInspector_SG2"
	CustomEditor "JTRP.ShaderDrawer.LWGUI"
}