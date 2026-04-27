Shader "Custom/Gelatine"
{
    Properties
    {
        [MainColor] _BaseColor("Base Color", Color) = (0.3, 1, 0.5, 1)
        _Amplitude("Amplitude", Float) = 0.1
        _Frequency("Frequency", Float) = 2.0
        _Speed("Speed", Float) = 1.0
    }

    SubShader
    {
        Tags { "RenderType" = "Opaque" "RendererPipeline"="UniversalPipeline" }

        Pass
        {
            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes{
                float4 position: POSITION;
            };

            struct Varyings{
                float4 positionHCS: SV_POSITION;
            };
            
            CBUFFER_START(UnityPerMaterial)
                float4 _BaseColor;
                float _Amplitude;
                float _Frequency;
                float _Speed;
            CBUFFER_END

            Varyings vert(Attributes v)
            {
                Varyings OUT;
                float3 pos = v.position.xyz;
                float time = _Time.y * _Speed;
                float wave = sin(pos.x * _Frequency + time) * _Amplitude;
                wave += cos(pos.z * _Frequency + time) * _Amplitude;

                pos.x += wave;

                OUT.positionHCS = TransformObjectToHClip(pos);
                return OUT;
            }

            half4 frag(Varyings IN) : SV_Target
            {
                return _BaseColor;
            }
            ENDHLSL
        }
    }
}
