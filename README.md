# Enhanced Hybrid Keyer 3.0

**Author:** RazvanO2 (Razvan Olariu)  
**GitHub:** [https://github.com/RazvanO2](https://github.com/RazvanO2)  
**Based on:** Hybrid Keyer by Eki "Halsu" Halkka  

## Overview

Enhanced Hybrid Keyer 3.0 is a professional-grade chroma key shader for OBS Studio using the obs-shaderfilter plugin. This shader features advanced keying algorithms, precise edge controls, and specialized tools for handling difficult keying situations like hair edges and uneven lighting.

## Features

### Key Improvements Over Original Version

- **Multiple Keying Methods**: Choose between RGB Difference (Vlahos method), YUV Color Space, and a Hybrid approach
- **Hair Edge Enhancement**: Specialized tools to recover fine details and prevent edge flickering
- **Edge Defringing**: Intelligent removal of color contamination on semi-transparent edges
- **Temporal Filtering**: Reduces frame-to-frame flickering for more stable output
- **Advanced Color Correction**: Full suite of color adjustment tools for the keyed result
- **Intuitive UI**: Logically grouped controls with descriptive labels
- **Fixed Syntax**: Corrected initialization issues and improved code stability

### Key Controls

- **Key Settings**: Control the basic keying process
- **Matte Controls**: Adjust foreground transparency and background cleanup
- **Shadow Enhancement**: Control shadow retention and position
- **Spill Removal**: Remove color contamination on subject edges
- **Color Correction**: Adjust final output appearance
- **Reference Images**: Use sample images to improve difficult keys
- **Temporal Filter**: Smooth results across frames
- **Preview Options**: Different visualization modes for debugging

## Installation

1. Install the [obs-shaderfilter](https://github.com/exeldro/obs-shaderfilter) plugin for OBS Studio
2. Download the `EnhancedHybridKeyer.shader` file
3. In OBS Studio, add a Filter to your video source
4. Select "User-defined Shader" from the filter dropdown
5. Load the shader file using the "Browse" button
6. Adjust settings as needed for your green/blue screen

## Usage Guide

### Basic Workflow

1. **Set Key Color**: Click the color picker to select your green/blue screen color
2. **Choose Keying Method**:
   - RGB Difference: Best for well-lit green screens
   - YUV Color Space: Better for blue screens
   - Hybrid: Best for difficult lighting situations
3. **Adjust Key Tolerance**: Increase until your subject is mostly separated
4. **Clean up Background**: Use "Background Cleanup" slider to remove remaining background
5. **Adjust Foreground**: Use "Foreground Opacity" to restore semi-transparent areas
6. **Fine-tune Edges**: Use "Hair Detail Recovery" and "Edge Defringe" for natural edges

### Advanced Controls

#### Hair and Fine Detail

The most challenging aspect of chroma keying is handling fine details like hair. This shader provides specialized tools:

- **Hair Detail Recovery**: This detects fine structures based on luminance differences and enhances their opacity. Start around 30-40% and adjust as needed.
- **Edge Defringe**: Removes green/blue contamination from semi-transparent edges. Set to 50-70% to remove color spill on hair edges.
- **Edge Softness**: Adds a subtle blur to reduce hard edges. Use sparingly (10-20%) to reduce flickering.

#### Spill Removal

Color spill is when the green/blue background reflects onto your subject:

- **Spill Reduction**: Controls overall spill removal strength
- **Red/Blue Balance**: Adjusts which colors are enhanced when removing spill
- **Edge Contrast**: Changes how spill removal is applied to edge areas
- **Spill Unpremultiply**: Attempts to mathematically remove key color from semi-transparent pixels

#### Temporal Filtering

If you have flickering edges between frames:

1. Enable "Temporal Filtering"
2. Set "Temporal Strength" to around 30-40%
3. This will average the key result over multiple frames

#### Shadow Retention

To keep natural shadows:

1. Increase "Shadow Amount" to taste
2. Adjust "Shadow Gradient Position" to control where shadows appear vertically
3. Use "Shadow Gradient Softness" to blend shadow edges

### Using Reference Images

For the best possible key with uneven lighting:

1. Take a clean plate shot of your empty green/blue screen
2. Enable "Use Reference Image" and select your reference image
3. Adjust "Reference Strength" to balance between direct keying and reference-based keying

### Preview Modes

Debugging tools to help visualize different aspects of the key:

- **Final Result**: The complete composited output
- **Alpha Channel**: White areas are visible, black areas are transparent
- **Pre-processed Foreground**: The image before keying operations
- **Processed Foreground**: The keyed foreground with alpha set to opaque
- **Edge Matte**: Shows where edge processing is being applied
- **Spill Matte**: Shows where spill removal is being applied

## Troubleshooting

### Flickering Edges

If you have flickering edges (especially around hair):

1. Increase "Hair Detail Recovery" to 40-60%
2. Add "Edge Defringe" around 50-70%
3. Enable "Temporal Filtering" at 30-40%
4. Try different "Keying Methods" (Hybrid often works best for difficult edges)

### Green/Blue Edge Contamination

If subject edges have color contamination:

1. Increase "Edge Defringe" to 60-80%
2. Try increasing "Spill Reduction" to 70-90%
3. Adjust "Red/Blue Balance" to target the specific color contamination

### Missing Fine Details

If hair or other fine details are being cut off:

1. Increase "Hair Detail Recovery"
2. Decrease "Background Cleanup"
3. Increase "Foreground Opacity"
4. Try the "Hybrid" keying method

### Uneven Lighting

If your green/blue screen has uneven lighting:

1. Use a reference image of the empty screen
2. Increase "Reference Strength" to 60-80%
3. Fine-tune with "Key Tolerance" and "Background Cleanup"

## Performance Considerations

This shader performs multiple texture samples and calculations, which may impact performance on lower-end systems. For better performance:

1. Disable "Temporal Filtering" when not needed
2. Use "Edge Anti-aliasing" sparingly
3. Consider reducing your source resolution if performance is an issue

## Contributing

Feel free to submit issues or improvements on GitHub: [https://github.com/RazvanO2](https://github.com/RazvanO2)

## License

This shader is provided under the MIT License.

## Acknowledgments

- Original Hybrid Keyer by Eki "Halsu" Halkka
- Improved and expanded by Razvan Olariu (RazvanO2)
