# Final-Shaders
Final Submission for the Rendering and Shader Class at VFS

## Description 
The objective of this assignment is to showcase different types of shader in Unity in a small scene in which all of them can be displayed side-by-side.

The goal of the project was to create different shader effects while showing how vertex shaders, fragment shaders, Shader Graph, and post-processing can work together in one cohesive scene.

## Scene concept
This scene representes a small alchemy laboratory in which, after an experiment went wrong, the environment got toxic. Because of this, the radiation, and the mixed chemicals, a glowing liquid, unstabled materials, and weird objects have been created.

## Implemented Shaders
### Vertex shader - Gelatin
This shader is made by manually modifying the HLSL, modifiying the vertices of the object over time using sine and cosine waves.

With these modifications the shader creates a material with a soft, organic movement that makes the object look like a mass has mutated and now has a gelatine consistent.

### Fragment Shader - Crystal
This shader is made in HLSL too. This one focuses on maniputaling each pixel color by using the UV coordinates and the time, blending different colors to create an animates iridescent effect on the crystal object.

### Environment shader - Toxic Liquid
This shader represents the main toxic chemical created when the experiment went wrong. This one is created with a shader graph and uses noise and a pattern that assimilates to bubbles to make the surface feel alive and unstable.

### Item Shader - Collectible
This material is created with a shader graph as base, and has a pulsing highlight effect to make the object stand out from the environment.

### Wood
This is an extra shader graph and material created to represents the wood of the different tables that where in the lab at the moment of the accident. Because of the radiaton and different waves the tables have 2 different colors representing the different types of materials.

This shader uses procedural lines and a little bit of noise to simulate the wood pattern on the surface, giving it the apparence of real wood.

## Post-Processing
The post-processing helps the atmosphere of the scene feel more in topic. Using the Bloom, Vignette, Color Adjustments, and Chromatic Aberration effects, these help reinforce the toxic laboratory mood, making emissive objects glow and adding a darker and more dramatic look to the scene

## GitHub
Click [here](https://github.com/FernandezDL/Final-Shaders.git) to see the GitHub repository

## Author
Diana Lucia Fernandez Villatoro - PG29