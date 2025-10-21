// Enhanced Hybrid Keyer 3.1 by Eki "Halsu" Halkka and Razvan "zvix" Olariu
// Chroma Keying Shader for OBS Studio - works with obs-shaderfilter 2.4.3 by Exaldro 
// Further enhanced with optimizations and new features

// ---- Key Settings ----
uniform float4 Key_color<
  string label = "Key Color";
  string widget_type = "color";
  string group = "1. Key Settings";
>;

uniform bool Auto_key_color<
  string label = "Auto-detect on first frame";
  string widget_type = "checkbox";
  string group = "1. Key Settings";
> = false;

uniform int Key_method<
  string label = "Keying Method";
  string widget_type = "select";
  string group = "1. Key Settings";
  int    option_0_value = 0;
  string option_0_label = "RGB Difference (Best for green screen)";
  int    option_1_value = 1;
  string option_1_label = "YUV Color Space (Best for blue screen)";
  int    option_2_value = 2;
  string option_2_label = "Hybrid (Best for difficult lighting)";
  int    option_3_value = 3;
  string option_3_label = "Multi-Layer (Best for complex scenes)";
> = 0;

uniform float Key_tolerance<
  string label = "Key Tolerance";
  string widget_type = "slider";
  string group = "1. Key Settings";
  float minimum = 0.0;
  float maximum = 100.0;
  float step = 1.0;
> = 50.0;

// ---- Advanced Key Settings ----
uniform bool Enable_multi_key<
  string label = "Enable Multi-Color Keying";
  string widget_type = "checkbox";
  string group = "1. Key Settings";
> = false;

uniform float4 Secondary_key_color<
  string label = "Secondary Key Color";
  string widget_type = "color";
  string group = "1. Key Settings";
>;

uniform float Secondary_key_weight<
  string label = "Secondary Key Weight";
  string widget_type = "slider";
  string group = "1. Key Settings";
  float minimum = 0.0;
  float maximum = 100.0;
  float step = 1.0;
> = 50.0;

uniform bool Enable_adaptive_sampling<
  string label = "Enable Adaptive Color Sampling";
  string widget_type = "checkbox";
  string group = "1. Key Settings";
> = false;

uniform float Prekey_despill<
  string label = "Prekey Despill";
  string widget_type = "slider";
  string group = "1. Key Settings";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Prekey_saturate<
  string label = "Prekey Saturate";
  string widget_type = "slider";
  string group = "1. Key Settings";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

// ---- Matte Controls ----
uniform float Matte_white<
  string label = "Foreground Opacity";
  string widget_type = "slider";
  string group = "2. Matte Controls";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Matte_black<
  string label = "Background Cleanup";
  string widget_type = "slider";
  string group = "2. Matte Controls";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Matte_highlights<
  string label = "Highlight Control";
  string widget_type = "slider";
  string group = "2. Matte Controls";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Matte_shadows<
  string label = "Shadow Control";
  string widget_type = "slider";
  string group = "2. Matte Controls";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Matte_offset_x<
  string label = "Matte Offset X";
  string widget_type = "slider";
  string group = "2. Matte Controls";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Matte_offset_y<
  string label = "Matte Offset Y";
  string widget_type = "slider";
  string group = "2. Matte Controls";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform bool Matte_antialising<
  string label = "Edge Anti-aliasing";
  string widget_type = "checkbox";
  string group = "2. Matte Controls";
> = true;

uniform float Edge_softness<
  string label = "Edge Softness";
  string widget_type = "slider";
  string group = "2. Matte Controls";
  float minimum = 0.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

// ---- Hair Enhancement ----
uniform float Hair_detail_enhance<
  string label = "Hair Detail Recovery";
  string widget_type = "slider";
  string group = "2. Matte Controls";
  float minimum = 0.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Edge_color_remove<
  string label = "Edge Defringe";
  string widget_type = "slider";
  string group = "2. Matte Controls";
  float minimum = 0.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

// ---- Shadow Enhancement ----
uniform float Shadows<
  string label = "Shadow Amount";
  string widget_type = "slider";
  string group = "3. Shadow Enhancement";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Shadow_Gradient_Position<
  string label = "Shadow Gradient Position";
  string widget_type = "slider";
  string group = "3. Shadow Enhancement";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Shadow_Gradient_Softness<
  string label = "Shadow Gradient Softness";
  string widget_type = "slider";
  string group = "3. Shadow Enhancement";
  float minimum = 0.0;
  float maximum = 100.0;
  float step = 1.0;
> = 50.0;

// ---- Spill Removal ----
uniform float Spill_reduction<
  string label = "Spill Reduction";
  string widget_type = "slider";
  string group = "4. Spill Removal";
  float minimum = 0.0;
  float maximum = 100.0;
  float step = 1.0;
> = 50.0;

uniform float Spill_balance<
  string label = "Red/Blue Balance";
  string widget_type = "slider";
  string group = "4. Spill Removal";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Spill_contrast<
  string label = "Edge Contrast";
  string widget_type = "slider";
  string group = "4. Spill Removal";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Spill_unpremultiply<
  string label = "Spill Unpremultiply";
  string widget_type = "slider";
  string group = "4. Spill Removal";
  float minimum = 0.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

// ---- Color Correction ----
uniform float Premultiply<
  string label = "Premultiply Alpha";
  string widget_type = "slider";
  string group = "5. Color Correction";
  float minimum = 0.0;
  float maximum = 200.0;
  float step = 1.0;
> = 100.0;

uniform float Hue_shift<
  string label = "Hue Adjustment";
  string widget_type = "slider";
  string group = "5. Color Correction";
  float minimum = -180.0;
  float maximum = 180.0;
  float step = 1.0;
> = 0.0;

uniform float Saturation<
  string label = "Saturation";
  string widget_type = "slider";
  string group = "5. Color Correction";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Brightness<
  string label = "Brightness";
  string widget_type = "slider";
  string group = "5. Color Correction";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

uniform float Contrast<
  string label = "Contrast";
  string widget_type = "slider";
  string group = "5. Color Correction";
  float minimum = -100.0;
  float maximum = 100.0;
  float step = 1.0;
> = 0.0;

// ---- Reference Images ----
uniform bool Use_reference_image<
  string label = "Use Reference Image";
  string widget_type = "checkbox";
  string group = "6. Reference Images";
> = false;

uniform texture2d Reference_image<
  string label = "Reference Background";
  string group = "6. Reference Images";
>;

uniform float Reference_strength<
  string label = "Reference Strength";
  string widget_type = "slider";
  string group = "6. Reference Images";
  float minimum = 0.0;
  float maximum = 100.0;
  float step = 1.0;
> = 50.0;

uniform bool Use_garbage_matte<
  string label = "Use Garbage Matte";
  string widget_type = "checkbox";
  string group = "6. Reference Images";
> = false;

uniform texture2d Garbage_matte<
  string label = "Garbage Matte";
  string group = "6. Reference Images";
>;

uniform bool Use_inside_matte<
  string label = "Use Inside Matte";
  string widget_type = "checkbox";
  string group = "6. Reference Images";
> = false;

uniform bool Preserve_inside_color<
  string label = "Preserve Inside Color";
  string widget_type = "checkbox";
  string group = "6. Reference Images";
> = false;

uniform texture2d Inside_matte<
  string label = "Inside Matte";
  string group = "6. Reference Images";
>;

uniform bool Use_shadow_matte<
  string label = "Use Shadow Matte";
  string widget_type = "checkbox";
  string group = "6. Reference Images";
> = false;

uniform texture2d Shadow_matte<
  string label = "Shadow Matte";
  string group = "6. Reference Images";
>;

// ---- Temporal Filter ----
uniform bool Enable_temporal<
  string label = "Enable Temporal Filtering";
  string widget_type = "checkbox";
  string group = "7. Temporal Filter";
> = false;

uniform float Temporal_strength<
  string label = "Temporal Strength";
  string widget_type = "slider";
  string group = "7. Temporal Filter";
  float minimum = 0.0;
  float maximum = 100.0;
  float step = 1.0;
> = 50.0;

uniform bool Motion_aware<
  string label = "Motion-Aware Filtering";
  string widget_type = "checkbox";
  string group = "7. Temporal Filter";
> = true;

// ---- Preview Options ----
uniform int Preview_mode<
  string label = "Preview Mode";
  string widget_type = "select";
  string group = "8. Preview";
  int    option_0_value = 0;
  string option_0_label = "Final Result";
  int    option_1_value = 1;
  string option_1_label = "Alpha Channel (White=visible areas)";
  int    option_2_value = 2;
  string option_2_label = "Pre-processed Foreground";
  int    option_3_value = 3;
  string option_3_label = "Processed Foreground";
  int    option_4_value = 4;
  string option_4_label = "Edge Matte (Shows edge areas)";
  int    option_5_value = 5;
  string option_5_label = "Spill Matte (Shows spill areas)";
  int    option_6_value = 6;
  string option_6_label = "Adaptive Sampling Map";
  int    option_7_value = 7;
  string option_7_label = "Multi-Key Blend";
  int    option_8_value = 8;
  string option_8_label = "Motion Detection Map";
> = 0;

uniform string Notes<
  string widget_type = "info";
  string group = "Help";
> = 'Enhanced Hybrid Keyer 3.1\n\nNew Features:\n- Multi-Layer Keying: Separates keying process by luminance zones\n- Motion-Aware Temporal Filtering: Reduces ghosting artifacts\n- Improved Adaptive Sampling: Better handles uneven lighting\n- Enhanced Hair Detail Recovery: More precise edge detection\n- Advanced Spill Suppression: Intelligently handles colored edges\n\nWorkflow tips:\n1. Select the appropriate key color(s) for your screen\n2. Try different keying methods for your specific footage\n3. Enable Adaptive Sampling for uneven backgrounds\n4. Adjust "Key Tolerance" until your subject is mostly separated\n5. Use "Background Cleanup" and "Foreground Opacity" to refine\n6. Increase "Hair Detail Recovery" and "Edge Defringe" for better edges\n7. Enable Motion-Aware Temporal Filtering to reduce flickering';

// ---- Global variables for temporal filtering ----
uniform texture2d Last_frame;

// ************************** Helper functions ****************************

float3 rgb2hsv(float3 c) 
{
    float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    float4 p = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
    float4 q = lerp(float4(p.xyw, c.r), float4(c.r, p.yzx), step(p.x, c.r));
    
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return float3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

float3 hsv2rgb(float3 c)
{
    float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    float3 p = abs(frac(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * lerp(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

// Main image function
float4 mainImage(VertData v_in) : TARGET
{
    // Convert slider values to appropriate ranges
    float prekey_despill_factor = Prekey_despill * 0.01;
    float prekey_saturate_factor = Prekey_saturate * 0.01;
    float matte_white_factor = 1.0 + (Matte_white * 0.01);
    float matte_black_factor = 1.0 + (Matte_black * 0.01);
    float matte_highlights_factor = Matte_highlights * 0.01;
    float matte_shadows_factor = Matte_shadows * 0.01;
    float shadow_amount = Shadows * 0.01;
    float shadow_position = Shadow_Gradient_Position * 0.01;
    float shadow_softness = 0.5 + (Shadow_Gradient_Softness * 0.005); // 0.5 to 1.0
    float spill_reduction_factor = Spill_reduction * 0.01;
    float spill_balance_factor = 0.5 + (Spill_balance * 0.005); // 0.0 to 1.0
    float spill_contrast_factor = Spill_contrast * 0.01;
    float spill_unpremultiply_factor = Spill_unpremultiply * 0.01;
    float premultiply_factor = Premultiply * 0.01;
    float reference_strength_factor = Reference_strength * 0.01;
    float temporal_blend = Temporal_strength * 0.01;
    float edge_softness_factor = Edge_softness * 0.01;
    float key_tolerance_factor = Key_tolerance * 0.01;
    float secondary_key_weight_factor = Secondary_key_weight * 0.01;
    float hair_detail_value = Hair_detail_enhance * 0.01;
    float defringe_value = Edge_color_remove * 0.01;
    
    // Color correction parameters
    float hue_adjustment = Hue_shift / 360.0;
    float saturation_adjustment = 1.0 + (Saturation * 0.01);
    float brightness_adjustment = Brightness * 0.01;
    float contrast_adjustment = 1.0 + (Contrast * 0.01);
    
    // Working variables
    float4 color = float4(1.0, 1.0, 1.0, 1.0);
    float4 rawColor = image.Sample(textureSampler, v_in.uv);
    float4 keyColorWorking = Key_color;
    float4 secondaryKeyWorking = Secondary_key_color;
    float4 prevFrame = float4(0.0, 0.0, 0.0, 0.0);
    float4 spillMatte = float4(0.0, 0.0, 0.0, 0.0);
    float4 edgeMatte = float4(0.0, 0.0, 0.0, 0.0);
    float4 adaptiveSampleMap = float4(0.0, 0.0, 0.0, 1.0);
    float4 multiKeyMap = float4(0.0, 0.0, 0.0, 1.0);
    float4 motionMap = float4(0.0, 0.0, 0.0, 1.0);
    float hueOffset = 0.0;
    float alpha = 0.0;
    float alphaSecondary = 0.0;
    
    // Calculate matte offset
    float dx = 1.0 / uv_size.x;
    float dy = 1.0 / uv_size.y;
    float offset_x = Matte_offset_x * 0.01 * dx;
    float offset_y = Matte_offset_y * 0.01 * dy;
    float2 offset_uv = v_in.uv + float2(offset_x, offset_y);
    
    // Step 1: Sample raw image with offset
    color = image.Sample(textureSampler, offset_uv);
    
    // Step 2: Apply adaptive sampling if enabled
    // Replace the current adaptive sampling code with this version focused on green screens
    if (Enable_adaptive_sampling)
    {
        float4 adaptiveKeyColor = Key_color; // Start with the user-selected key color as fallback
        float bestGreenDominance = 0.0;
        
        int sampleRadius = 3.0;
        
        // First scan the perimeter of the search area to find good green screen samples
        // This avoids sampling from the subject which is typically more central
        for (int scan_pass = 0; scan_pass < 2; scan_pass++) {
            for (int i = -sampleRadius; i <= sampleRadius; i++) {
                for (int j = -sampleRadius; j <= sampleRadius; j++) {
                    // In first scan_pass, only check perimeter points
                    // In second scan_pass, check all points if we haven't found a good sample yet
                    if (scan_pass == 0 && 
                        !(i == -sampleRadius || i == sampleRadius || 
                          j == -sampleRadius || j == sampleRadius)) {
                        continue;
                    }
                    
                    float2 offset = float2(i * dx, j * dy);
                    float4 sampleCol = image.Sample(textureSampler, offset_uv + offset);
                    
                    // Specifically look for green dominance - this is crucial
                    float greenMinThreshold = 0.15; // Minimum green value
                    float greenDominance = sampleCol.g - max(sampleCol.r, sampleCol.b);
                    
                    // Only consider pixels where green is clearly the dominant channel
                    if (sampleCol.g > greenMinThreshold && greenDominance > 0.1) {
                        // Calculate sample quality based on green dominance and distance from center
                        float sampleQuality = greenDominance;
                        
                        // Take the sample with the strongest green dominance
                        if (sampleQuality > bestGreenDominance) {
                            bestGreenDominance = sampleQuality;
                            adaptiveKeyColor = sampleCol;
                        }
                    }
                }
            }
            
            // If we found a good sample in the first scan_pass, no need for second scan_pass
            if (bestGreenDominance > 0.0 && scan_pass == 0) {
                break;
            }
        }
        
        // For visualization - show what's being used as the key color
        adaptiveSampleMap.rgb = adaptiveKeyColor.rgb;
        keyColorWorking = adaptiveKeyColor;
    }
    
    // Step 3: Apply edge anti-aliasing if enabled
    if (Matte_antialising)
    {
        float4 sum = color;
        float weight = 1.0;
        
        // Sample neighboring pixels with weights
        sum += 0.5 * image.Sample(textureSampler, offset_uv + float2(-dx, -dy));
        sum += 1.0 * image.Sample(textureSampler, offset_uv + float2(0, -dy));
        sum += 0.5 * image.Sample(textureSampler, offset_uv + float2(dx, -dy));
        
        sum += 1.0 * image.Sample(textureSampler, offset_uv + float2(-dx, 0));
        sum += 1.0 * image.Sample(textureSampler, offset_uv + float2(dx, 0));
        
        sum += 0.5 * image.Sample(textureSampler, offset_uv + float2(-dx, dy));
        sum += 1.0 * image.Sample(textureSampler, offset_uv + float2(0, dy));
        sum += 0.5 * image.Sample(textureSampler, offset_uv + float2(dx, dy));
        
        weight += 0.5 + 1.0 + 0.5 + 1.0 + 1.0 + 0.5 + 1.0 + 0.5;
        
        // Calculate weighted average
        color = sum / weight;
        
        // Restore some of the original key color to avoid over-blurring
        // Determine dominant channel in key color
        if (keyColorWorking.g > keyColorWorking.r && keyColorWorking.g > keyColorWorking.b) {
            // Green screen case
            color.g = lerp(color.g, rawColor.g, 0.5);
        } else if (keyColorWorking.b > keyColorWorking.r && keyColorWorking.b > keyColorWorking.g) {
            // Blue screen case
            color.b = lerp(color.b, rawColor.b, 0.5);
        } else {
            // Red screen case
            color.r = lerp(color.r, rawColor.r, 0.5);
        }
    }
    
    // Step 4: Use reference image if enabled
    float4 referenceColor = float4(0.0, 0.0, 0.0, 0.0);
    if (Use_reference_image)
    {
        referenceColor = Reference_image.Sample(textureSampler, v_in.uv);
        
        // Clean up background using reference image
        color.rgb = lerp(color.rgb, referenceColor.rgb, reference_strength_factor);
        keyColorWorking.rgb = referenceColor.rgb;
    }
    
    // Store pre-processed color for preview
    float4 prekeyColor = color;
    
    // Step 5: Apply prekey processing
    float3 hsvColor = rgb2hsv(color.rgb);
    float3 hsvKey = rgb2hsv(keyColorWorking.rgb);
    float3 hsvRaw = rgb2hsv(rawColor.rgb);
    
    // Calculate hue offset to align key color with pure green/blue/red
    if (keyColorWorking.g > keyColorWorking.r && keyColorWorking.g > keyColorWorking.b) {
        // Green dominant - align to 0.33333 (green)
        if (hsvKey.x < 0.33333)
            hueOffset = (0.33333 - hsvKey.x);
        else
            hueOffset = -(hsvKey.x - 0.33333);
    }
    else if (keyColorWorking.b > keyColorWorking.r && keyColorWorking.b > keyColorWorking.g) {
        // Blue dominant - align to 0.66667 (blue)
        if (hsvKey.x < 0.66667)
            hueOffset = (0.66667 - hsvKey.x);
        else
            hueOffset = -(hsvKey.x - 0.66667);
    }
    else {
        // Red dominant - align to 0.0/1.0 (red)
        if (hsvKey.x > 0.5)
            hueOffset = (1.0 - hsvKey.x);
        else
            hueOffset = -hsvKey.x;
    }
    
    // Apply hue offset to align with pure green/blue/red for better chroma keying
    hsvColor.x = hsvColor.x + hueOffset;
    hsvKey.x = hsvKey.x + hueOffset;
    hsvRaw.x = hsvRaw.x + hueOffset;
    
    // Apply prekey saturation adjustment
    hsvColor.y = hsvColor.y * (1.0 + prekey_saturate_factor);
    hsvKey.y = hsvKey.y * (1.0 + prekey_saturate_factor);
    
    // Convert back to RGB
    color.rgb = hsv2rgb(hsvColor);
    keyColorWorking.rgb = hsv2rgb(hsvKey);
    rawColor.rgb = hsv2rgb(hsvRaw);
    
    // Apply prekey despill to reduce color contamination before keying
    // Apply to the appropriate channel based on dominant color
    if (keyColorWorking.g > keyColorWorking.r && keyColorWorking.g > keyColorWorking.b) {
        // Green dominant
        color.rb += prekey_despill_factor;
    }
    else if (keyColorWorking.b > keyColorWorking.r && keyColorWorking.b > keyColorWorking.g) {
        // Blue dominant
        color.rg += prekey_despill_factor;
    }
    else {
        // Red dominant
        color.gb += prekey_despill_factor;
    }
    
    // Step 6: Calculate alpha matte based on keying method
    if (Key_method == 0) // RGB Difference (Vlahos method)
    {
        // Determine which channel to key against based on key color
        if (keyColorWorking.g > keyColorWorking.r && keyColorWorking.g > keyColorWorking.b) {
            // Green screen
            alpha = color.g - max(color.r, color.b);
        }
        else if (keyColorWorking.b > keyColorWorking.r && keyColorWorking.b > keyColorWorking.g) {
            // Blue screen
            alpha = color.b - max(color.r, color.g);
        }
        else {
            // Red screen
            alpha = color.r - max(color.g, color.b);
        }
        
        // Apply key tolerance
        alpha = alpha * (1.0 + key_tolerance_factor);
    }
    else if (Key_method == 1) // YUV Color Space
    {
        // Convert to YUV for better color separation
        float Y = 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;
        float U = ((color.b - Y) * 0.565) + 0.5;
        float V = ((color.r - Y) * 0.713) + 0.5;
        
        // Reference key color in YUV
        float Y2 = 0.299 * keyColorWorking.r + 0.587 * keyColorWorking.g + 0.114 * keyColorWorking.b;
        float U2 = ((keyColorWorking.b - Y2) * 0.565) + 0.5;
        float V2 = ((keyColorWorking.r - Y2) * 0.713) + 0.5;
        
        // Calculate color difference in YUV space
        float3 yuv_diff = abs(float3(Y, U, V) / float3(Y2, U2, V2) - 1.0);
        
        // Calculate alpha from color difference
        alpha = 1.0 - (key_tolerance_factor + 1.0) * max(yuv_diff.y, yuv_diff.z);
    }
    else if (Key_method == 2) // Hybrid method
    {
        float alpha_rgb = 0.0;
        
        // RGB component - adapt to the dominant channel
        if (keyColorWorking.g > keyColorWorking.r && keyColorWorking.g > keyColorWorking.b) {
            // Green screen
            alpha_rgb = color.g - max(color.r, color.b);
        }
        else if (keyColorWorking.b > keyColorWorking.r && keyColorWorking.b > keyColorWorking.g) {
            // Blue screen
            alpha_rgb = color.b - max(color.r, color.g);
        }
        else {
            // Red screen
            alpha_rgb = color.r - max(color.g, color.b);
        }
        
        // YUV component
        float Y = 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;
        float U = ((color.b - Y) * 0.565) + 0.5;
        float V = ((color.r - Y) * 0.713) + 0.5;
        
        float Y2 = 0.299 * keyColorWorking.r + 0.587 * keyColorWorking.g + 0.114 * keyColorWorking.b;
        float U2 = ((keyColorWorking.b - Y2) * 0.565) + 0.5;
        float V2 = ((keyColorWorking.r - Y2) * 0.713) + 0.5;
        
        float3 yuv_diff = abs(float3(Y, U, V) / float3(Y2, U2, V2) - 1.0);
        float alpha_yuv = 1.0 - 2.0 * max(yuv_diff.y, yuv_diff.z);
        
        // Combine the two methods based on key tolerance
        alpha = lerp(alpha_rgb, alpha_yuv, key_tolerance_factor);
    }
    else if (Key_method == 3) // Multi-Layer method
    {
        // Multi-Layer keying - inlined
        float baseAlpha = 0.0;
        
        // Calculate base alpha based on dominant channel
        if (keyColorWorking.g > keyColorWorking.r && keyColorWorking.g > keyColorWorking.b) {
            baseAlpha = color.g - max(color.r, color.b);
        } else if (keyColorWorking.b > keyColorWorking.r && keyColorWorking.b > keyColorWorking.g) {
            baseAlpha = color.b - max(color.r, color.g);
        } else {
            baseAlpha = color.r - max(color.g, color.b);
        }
        
        baseAlpha = baseAlpha * (1.0 + key_tolerance_factor);
        
        // Calculate luminance values
        float colorLuma = dot(color.rgb, float3(0.2126, 0.7152, 0.0722));
        float keyLuma = dot(keyColorWorking.rgb, float3(0.2126, 0.7152, 0.0722));
        
        // Define luminance zones
        float shadowThreshold = keyLuma * 0.7;
        float highlightThreshold = keyLuma * 1.3;
        
        float shadowAlpha = 0.0;
        float midtoneAlpha = 0.0;
        float highlightAlpha = 0.0;
        
        // Process shadow zone
        if (colorLuma < shadowThreshold) {
            float shadowFactor = 1.0 - (colorLuma / shadowThreshold);
            shadowAlpha = baseAlpha * (1.0 - (shadowFactor * 0.5));
        }
        
        // Process midtone zone
        if (colorLuma >= shadowThreshold && colorLuma <= highlightThreshold) {
            float midtoneFactor = 1.0 - (2.0 * abs(colorLuma - keyLuma) / (highlightThreshold - shadowThreshold));
            midtoneAlpha = baseAlpha * midtoneFactor;
        }
        
        // Process highlight zone
        if (colorLuma > highlightThreshold) {
            float highlightFactor = (colorLuma - highlightThreshold) / (1.0 - highlightThreshold);
            highlightAlpha = baseAlpha * (1.0 - (highlightFactor * 0.3));
        }
        
        // Combine results
        alpha = max(shadowAlpha, max(midtoneAlpha, highlightAlpha));
    }
    
    // Step 7: Process secondary key if multi-key is enabled
    if (Enable_multi_key)
    {
        float3 hsvSecondary = rgb2hsv(Secondary_key_color.rgb);
        
        // Apply the same hue offset to align with primary key
        hsvSecondary.x = hsvSecondary.x + hueOffset;
        float3 secondaryRgb = hsv2rgb(hsvSecondary);
        secondaryKeyWorking.rgb = secondaryRgb;
        
        // Process secondary key with the same method as primary
        if (Key_method == 0) // RGB Difference
        {
            // Determine which channel to key against based on secondary key color
            if (secondaryKeyWorking.g > secondaryKeyWorking.r && secondaryKeyWorking.g > secondaryKeyWorking.b) {
                // Green screen
                alphaSecondary = color.g - max(color.r, color.b);
            }
            else if (secondaryKeyWorking.b > secondaryKeyWorking.r && secondaryKeyWorking.b > secondaryKeyWorking.g) {
                // Blue screen
                alphaSecondary = color.b - max(color.r, color.g);
            }
            else {
                // Red screen
                alphaSecondary = color.r - max(color.g, color.b);
            }
            
            // Apply key tolerance
            alphaSecondary = alphaSecondary * (1.0 + key_tolerance_factor);
        }
        else if (Key_method == 1) // YUV Color Space
        {
            // Convert to YUV
            float Y = 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;
            float U = ((color.b - Y) * 0.565) + 0.5;
            float V = ((color.r - Y) * 0.713) + 0.5;
            
            // Secondary key color in YUV
            float Y3 = 0.299 * secondaryKeyWorking.r + 0.587 * secondaryKeyWorking.g + 0.114 * secondaryKeyWorking.b;
            float U3 = ((secondaryKeyWorking.b - Y3) * 0.565) + 0.5;
            float V3 = ((secondaryKeyWorking.r - Y3) * 0.713) + 0.5;
            
            // Calculate color difference in YUV space
            float3 yuv_diff_sec = abs(float3(Y, U, V) / float3(Y3, U3, V3) - 1.0);
            
            // Calculate alpha from color difference
            alphaSecondary = 1.0 - (key_tolerance_factor + 1.0) * max(yuv_diff_sec.y, yuv_diff_sec.z);
        }
        else if (Key_method == 2 || Key_method == 3) // Hybrid or Multi-Layer method
        {
            // For hybrid method, use a color distance approach for secondary
            float colorDistance = 0.0;
            {
                float3 diff = abs(color.rgb - secondaryKeyWorking.rgb);
                colorDistance = length(diff) / 1.732; // Normalize by sqrt(3)
            }
            
            alphaSecondary = 1.0 - colorDistance;
            alphaSecondary = saturate(alphaSecondary * (1.0 + key_tolerance_factor));
        }
        
        // Blend primary and secondary keys based on weight factor
        alpha = lerp(alpha, max(alpha, alphaSecondary), secondary_key_weight_factor);
        
        // Create multi-key visualization for preview
        multiKeyMap.r = alpha;
        multiKeyMap.g = alphaSecondary; 
        multiKeyMap.b = max(alpha, alphaSecondary);
    }
    
    // Store the raw alpha for edge detection
    edgeMatte.a = alpha;
    color.a = alpha;
    
    // Step 8: Process highlights and shadows in the matte
    
    // Handle bright areas that should be keyed (like reflections)
    if (matte_highlights_factor > 0.0)
    {
        float highlightDiff = dot(color.rgb - keyColorWorking.rgb, float3(1.0, 1.0, 1.0));
        color.a -= matte_highlights_factor * saturate(highlightDiff);
    }
    
    // Handle dark areas that should be keyed (like shadows)
    if (matte_shadows_factor > 0.0)
    {
        float shadowDiff = dot((1.0 - color.rgb) - (1.0 - keyColorWorking.rgb), float3(1.0, 1.0, 1.0));
        color.a -= matte_shadows_factor * saturate(shadowDiff);
    }
    
    // Process black shadows separately (to add back as shadows)
    float blackShadowAlpha = 0.0;
    if (shadow_amount > 0.0)
    {
        // Calculate shadow area based on darker areas different from key color
        float shadowDiff = dot((1.0 - color.rgb) - (1.0 - keyColorWorking.rgb), float3(1.0, 1.0, 1.0));
        blackShadowAlpha = shadow_amount * saturate(shadowDiff);
        
        // Apply shadow gradient
        if (shadow_position != 0.0)
        {
            float screenPos = v_in.uv.y;
            float gradientPos = 0.5 + shadow_position;
            float t = clamp((screenPos - (gradientPos - shadow_softness)) / (2.0 * shadow_softness), 0.0, 1.0);
            blackShadowAlpha *= t;
        }
        
        // Apply shadow matte if available
        if (Use_shadow_matte)
        {
            float4 shadowMatteColor = Shadow_matte.Sample(textureSampler, v_in.uv);
            float shadowMask = max(shadowMatteColor.r, max(shadowMatteColor.g, shadowMatteColor.b));
            blackShadowAlpha *= shadowMask;
        }
    }
    
    // Step 9: Apply matte controls for refining the key
    
    // Apply black point adjustment (background cleanup)
    color.a = color.a * matte_black_factor;
    
    // Invert alpha for foreground/background logic (0=background, 1=foreground)
    color.a = 1.0 - color.a;
    
    // Apply white point adjustment (foreground opacity)
    color.a = saturate(color.a * matte_white_factor);
    
    // Step 10: Apply hair detail enhancement for better edges
    if (hair_detail_value > 0.0)
    {
        // Simplified, more stable hair detail enhancement
        float rawLuma = dot(rawColor.rgb, float3(0.2126, 0.7152, 0.0722));
        float keyLuma = dot(keyColorWorking.rgb, float3(0.2126, 0.7152, 0.0722));
        
        // Find edge areas (partially transparent)
        float edgeMask = 1.0 - abs((color.a * 2.0) - 1.0);
        edgeMask = pow(edgeMask, 0.5); // Broaden the edge area a bit
        
        // Simple luminance difference for detail detection
        float lumaDiff = saturate(abs(rawLuma - keyLuma) * 2.0);
        
        // Apply enhancement only in edge areas with detail
        float enhancementMask = edgeMask * lumaDiff;
        color.a = saturate(color.a + (enhancementMask * hair_detail_value));
    }
    
    // Step 11: Apply edge softness
    if (edge_softness_factor > 0.0)
    {
        // Calculate edge matte
        edgeMatte.a = 1.0 - abs(color.a * 2.0 - 1.0); // Find edges (where alpha is around 0.5)
        edgeMatte.a = pow(edgeMatte.a, 2.0 - edge_softness_factor); // Adjust edge width based on softness
        
        // Soften the alpha at edges
        float softenedAlpha = lerp(color.a, 0.5, edgeMatte.a * edge_softness_factor);
        color.a = softenedAlpha;
    }
    
    // Store edge matte for preview
    edgeMatte.rgb = edgeMatte.aaa;
    
    // Step 12: Apply spill reduction if enabled
    if (spill_reduction_factor > 0.0)
{
    // Simpler despill based on Halsu_despill.shader
    float spillRB = lerp(color.r, color.b, spill_balance_factor);
    
    // Determine dominant channel
    if (keyColorWorking.g > keyColorWorking.r && keyColorWorking.g > keyColorWorking.b) {
        // Green screen case
        if (color.g > spillRB) {
            color.g = lerp(color.g, spillRB, spill_reduction_factor);
        }
        spillMatte.g = max(0.0, color.g - spillRB);
    }
    else if (keyColorWorking.b > keyColorWorking.r && keyColorWorking.b > keyColorWorking.g) {
        // Blue screen case
        if (color.b > spillRB) {
            color.b = lerp(color.b, spillRB, spill_reduction_factor);
        }
        spillMatte.b = max(0.0, color.b - spillRB);
    }
    else {
        // Red screen case
        float spillGB = max(color.g, color.b);
        if (color.r > spillGB) {
            color.r = lerp(color.r, spillGB, spill_reduction_factor);
        }
        spillMatte.r = max(0.0, color.r - spillGB);
    }
    
    // Apply unpremultiply if needed
    if (spill_unpremultiply_factor > 0.0 && color.a > 0.0 && color.a < 0.99) {
        color.rgb = lerp(color.rgb, color.rgb / max(color.a, 0.001), spill_unpremultiply_factor * (1.0 - color.a));
    }
}
    
    // Step 13: Handle alpha and color adjustment for the foreground
    if (color.a > 0.0)
    {
        if (color.a < 1.0)
        {
            // Apply premultiply setting for semi-transparent areas
            if (premultiply_factor < 1.0)
            {
                // Unpremultiply then repremultiply with custom factor
                color.rgb = lerp(rawColor.rgb / max(color.a, 0.001), rawColor.rgb, premultiply_factor);
            }
            else if (premultiply_factor > 1.0)
            {
                // Extra premultiplication for stronger alpha effect
                float extra = (premultiply_factor - 1.0);
                color.rgb = lerp(rawColor.rgb, rawColor.rgb * color.a, extra);
            }
            else
            {
                // At exactly 1.0, use raw color
                color.rgb = rawColor.rgb;
            }
        }
        else
        {
            // Fully opaque areas get raw color
            color.rgb = rawColor.rgb;
        }
    }
    
    // Step 14: Apply matte overlays
    
    // Apply garbage matte (exclude areas)
    if (Use_garbage_matte)
    {
        float4 garbageColor = Garbage_matte.Sample(textureSampler, v_in.uv);
        float garbageMask = max(garbageColor.r, max(garbageColor.g, garbageColor.b));
        color.a = max(0.0, color.a - (1.0 - garbageMask));
    }
    
    // Apply inside matte (include areas)
    if (Use_inside_matte)
    {
        float4 insideColor = Inside_matte.Sample(textureSampler, v_in.uv);
        float insideMask = max(insideColor.r, max(insideColor.g, insideColor.b));
        color.a = min(1.0, color.a + insideMask);
        
        // Preserve original color in inside matte areas if enabled
        if (Preserve_inside_color && insideMask > 0.0)
        {
            color.rgb = lerp(color.rgb, rawColor.rgb, insideMask);
        }
    }
    
    // Add shadow if enabled
    if (blackShadowAlpha > 0.0)
    {
        // Blend shadow with main alpha
        color.rgb = lerp(color.rgb, float3(0.0, 0.0, 0.0), blackShadowAlpha * (1.0 - color.a));
        color.a = saturate(color.a + blackShadowAlpha);
    }
    
    // Step 15: Apply edge defringing if enabled
    if (defringe_value > 0.0)
    {
        // Edge defringing - inlined
        // Only apply to partially transparent areas
        if (color.a < 1.0) {
            float edgeDefringeValue = (1.0 - color.a) * defringe_value;
            
            // Determine dominant channel
            float keyMax = max(keyColorWorking.r, max(keyColorWorking.g, keyColorWorking.b));
            
            // Green screen case
            if (keyColorWorking.g > 0.4 && keyColorWorking.g >= keyColorWorking.r && keyColorWorking.g >= keyColorWorking.b) {
                float adjust = keyColorWorking.g / max(0.001, keyMax);
                color.g *= (1.0 - (edgeDefringeValue * adjust));
                color.rb *= (1.0 + (edgeDefringeValue * 0.2));
            } 
            // Blue screen case
            else if (keyColorWorking.b > 0.4 && keyColorWorking.b >= keyColorWorking.g && keyColorWorking.b >= keyColorWorking.r) {
                float adjust = keyColorWorking.b / max(0.001, keyMax);
                color.b *= (1.0 - (edgeDefringeValue * adjust));
                color.rg *= (1.0 + (edgeDefringeValue * 0.2));
            }
            // Red screen case
            else if (keyColorWorking.r > 0.4 && keyColorWorking.r >= keyColorWorking.g && keyColorWorking.r >= keyColorWorking.b) {
                float adjust = keyColorWorking.r / max(0.001, keyMax);
                color.r *= (1.0 - (edgeDefringeValue * adjust));
                color.gb *= (1.0 + (edgeDefringeValue * 0.2));
            }
        }
    }
    
    // Step 16: Apply temporal filtering if enabled
    float4 filteredColor = color;
    // Step 16: Apply temporal filtering if enabled
    if (Enable_temporal && temporal_blend > 0.0)
    {
        prevFrame = Last_frame.Sample(textureSampler, v_in.uv);
        
        // Calculate a blend factor that reduces flickering
        float blendFactor = temporal_blend;
        
        if (Motion_aware)
        {
            // Calculate motion but with reduced sensitivity to small changes
            float3 frameDiff = abs(color.rgb - prevFrame.rgb);
            float motionAmount = saturate(dot(frameDiff, float3(0.2126, 0.7152, 0.0722)) - 0.05);
            
            // Use higher threshold for alpha changes to reduce edge flickering
            float alphaDiff = saturate(abs(color.a - prevFrame.a) - 0.05);
            
            // Adjust temporal strength - maintain more temporal filtering even with motion
            blendFactor = temporal_blend * (1.0 - (motionAmount * 1.5));
            blendFactor = max(temporal_blend * 0.25, blendFactor); // Keep minimum filtering
            
            // Reduce strength in edge areas but not as drastically
            blendFactor *= (1.0 - (alphaDiff * 0.5));
            
            motionMap.rgb = float3(motionAmount, motionAmount, motionAmount);
        }
        
        // Apply filtered blend
        color = lerp(color, prevFrame, blendFactor);
    }
    
    // Step 17: Apply color correction to final result
    
    // Apply color correction only to non-transparent areas
    if (color.a > 0.0)
    {
        // Convert to HSV for better color manipulation
        float3 hsvFinal = rgb2hsv(color.rgb);
        
        // Apply hue shift
        hsvFinal.x = frac(hsvFinal.x + hue_adjustment);
        
        // Apply saturation
        hsvFinal.y = saturate(hsvFinal.y * saturation_adjustment);
        
        // Apply brightness
        hsvFinal.z = saturate(hsvFinal.z * (1.0 + brightness_adjustment));
        
        // Convert back to RGB
        color.rgb = hsv2rgb(hsvFinal);
        
        // Apply contrast (after HSV adjustments)
        if (contrast_adjustment != 1.0)
        {
            float3 gray = float3(0.5, 0.5, 0.5);
            color.rgb = lerp(gray, color.rgb, contrast_adjustment);
        }
    }
    
    // Restore hue shift to match original video (undo the keying alignment)
    float3 hsvFinal = rgb2hsv(color.rgb);
    hsvFinal.x = hsvFinal.x - hueOffset;
    color.rgb = hsv2rgb(hsvFinal);
    
    // Ensure zero alpha gives black RGB (prevents fringing)
    color.rgb *= color.a;
    
    // Step 18: Handle preview modes
    switch (Preview_mode)
    {
        case 0: // Final result
            // Keep color as is
            break;
        case 1: // Alpha channel
            color.rgb = color.aaa;
            color.a = 1.0;
            break;
        case 2: // Pre-processed foreground
            color = prekeyColor;
            color.a = 1.0;
            break;
        case 3: // Processed foreground
            color.a = 1.0;
            break;
        case 4: // Edge matte
            color = edgeMatte;
            color.a = 1.0;
            break;
        case 5: // Spill matte
            color = spillMatte;
            color.a = 1.0;
            break;
        case 6: // Adaptive sampling map
            color = adaptiveSampleMap;
            break;
        case 7: // Multi-key blend
            color = multiKeyMap;
            break;
        case 8: // Motion detection map
            color = motionMap;
            break;
    }
    
    return color;
}