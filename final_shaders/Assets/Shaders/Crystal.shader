Shader "Custom/Crystal"
{
    Properties
    {
        [MainColor] _BaseColor("Base Color", Color) = (0.1, 1, 0.8, 1)
        _SecondaryColor("Secondary Color", Color)=(1, 0.2, 1, 1)
        _EmissionStrength ("Emission Strength", Float) = 2.0
        _Speed ("Speed", Float) = 1.0
        _PatternScale ("Pattern Scale", Float) = 8.0
    }

    SubShader
    {
        Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline" }

        Pass
        {
            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
                float2 uv : TEXCOORD0;
                float positionWS: TEXCOORD1;
            };

            CBUFFER_START(UnityPerMaterial)
                float4 _BaseColor;
                float4 _SecondaryColor;
                float _EmissionStrength;
                float _Speed;
                float _PatternScale;
            CBUFFER_END

            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                OUT.positionWS = TransformObjectToWorld(IN.positionOS.xyz);
                OUT.uv = IN.uv;

                return OUT;
            }

            half4 frag(Varyings IN) : SV_Target
            {
                float time = _Time.y * _Speed;

                float pattern = sin((IN.uv.x + IN.uv.y) *_PatternScale +time);
                pattern = pattern *0.5 +0.5;

                float glow = saturate(IN.uv.y);

                float4 color = lerp(_BaseColor, _SecondaryColor, pattern);
                color.rgb += glow * 0.5;

                color.rgb *= _EmissionStrength;
                return color;
            }
            ENDHLSL
        }
    }
}
