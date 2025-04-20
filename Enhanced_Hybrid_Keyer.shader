// Enhanced Hybrid Keyer 3.0
// Chroma Keying Shader for OBS Studio - works with obs-shaderfilter 2.4.3 by Exaldro 
// Based on Hybrid keyer by Eki "Halsu" Halkka
// Improved with fixes, optimizations, and new features by Razvan "zvix" Olariu


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
> = 0;

uniform float Key_tolerance<
  string label = "Key Tolerance";
  string widget_type = "slider";
  string group = "1. Key Settings";
  float minimum = 0.0;
  float maximum = 100.0;
  float step = 1.0;
> = 50.0;

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

// Advanced matte controls now always visible

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
> = 0;

uniform string Notes<
  string widget_type = "info";
  string group = "Help";
> = 'Enhanced Hybrid Keyer 3.0\n\nThis shader provides professional-grade chroma keying for OBS.\n\nWorkflow tips:\n1. Select the appropriate key color (green or blue screen)\n2. Adjust "Key Tolerance" until your subject is mostly separated\n3. Use "Background Cleanup" to remove background remnants\n4. Use "Foreground Opacity" to restore semi-transparent areas\n5. Adjust "Spill Reduction" to remove color spill on edges\n6. For hair edges: increase "Hair Detail Recovery" and "Edge Defringe"\n7. If edges flicker, try "Edge Softness" or "Temporal Filtering"\n\nFor best results with uneven lighting, use a reference image of the empty background.';

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

// Safely apply color correction to avoid division by zero
float3 safeColorCorrection(float3 color, float3 keyColor, float factor)
{
    float3 result = color;
    // Avoid division by zero by adding a small epsilon
    float3 safeKeyColor = max(keyColor, 0.001);
    
    // Apply color correction
    result.r = lerp(color.r, color.r / safeKeyColor.r, factor);
    result.g = lerp(color.g, color.g / safeKeyColor.g, factor);
    result.b = lerp(color.b, color.b / safeKeyColor.b, factor);
    
    return result;
}

// ******************************************************************************** MAIN **************************************************************

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
    
    // Color correction parameters
    float hue_adjustment = Hue_shift / 360.0;
    float saturation_adjustment = 1.0 + (Saturation * 0.01);
    float brightness_adjustment = Brightness * 0.01;
    float contrast_adjustment = 1.0 + (Contrast * 0.01);
    
    // Working variables
    float4 color = float4(1.0, 1.0, 1.0, 1.0);
    float4 raw_color;
    float4 reference_color = float4(0.0, 0.0, 0.0, 0.0);
    float4 key_color_working = Key_color;
    float4 prev_frame = float4(0.0, 0.0, 0.0, 0.0);
    float4 spill_matte = float4(0.0, 0.0, 0.0, 0.0);
    float4 edge_matte = float4(0.0, 0.0, 0.0, 0.0);
    float hue_offset = 0.0;
    
    // Calculate matte offset
    float dx = 1.0 / uv_size.x;
    float dy = 1.0 / uv_size.y;
    float offset_x = Matte_offset_x * 0.01 * dx;
    float offset_y = Matte_offset_y * 0.01 * dy;
    
    // Sample the raw color from the image
    raw_color = image.Sample(textureSampler, v_in.uv);
    
    // Apply matte offset
    float2 offset_uv = v_in.uv + float2(offset_x, offset_y);
    color = image.Sample(textureSampler, offset_uv);
    
    // Apply edge anti-aliasing if enabled
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
        
        // Restore some of the original green to avoid over-blurring
        color.g = lerp(color.g, raw_color.g, 0.5);
    }
    
    // Use reference image if enabled
    if (Use_reference_image)
    {
        reference_color = Reference_image.Sample(textureSampler, v_in.uv);
        
        // Clean up background using reference image
        color.rgb = lerp(color.rgb, (1.0 - reference_color.rgb), reference_strength_factor * 0.5);
        key_color_working.rgb = reference_color.rgb;
    }
    
    // Convert to HSV for better color manipulation
    float3 hsv_color = rgb2hsv(color.rgb);
    float3 hsv_key = rgb2hsv(key_color_working.rgb);
    float3 hsv_raw = rgb2hsv(raw_color.rgb);
    
    // Calculate hue offset to align key color with pure green (0.33333)
    if (hsv_key.x < 0.33333)
        hue_offset = (0.33333 - hsv_key.x);
    else
        hue_offset = -(hsv_key.x - 0.33333);
    
    // Apply hue offset to align with pure green/blue for better chroma keying
    hsv_color.x = hsv_color.x + hue_offset;
    hsv_key.x = hsv_key.x + hue_offset;
    hsv_raw.x = hsv_raw.x + hue_offset;
    
    // Apply prekey saturation adjustment
    hsv_color.y = hsv_color.y * (1.0 + prekey_saturate_factor);
    hsv_key.y = hsv_key.y * (1.0 + prekey_saturate_factor);
    
    // Convert back to RGB
    color.rgb = hsv2rgb(hsv_color);
    key_color_working.rgb = hsv2rgb(hsv_key);
    raw_color.rgb = hsv2rgb(hsv_raw);
    
    // Store pre-processed color for preview
    float4 prekey_color = color;
    
    // Apply prekey despill to reduce green contamination before keying
    prekey_color.r += prekey_despill_factor;
    prekey_color.b += prekey_despill_factor;
    color.r += prekey_despill_factor;
    color.b += prekey_despill_factor;
    
    // --------------- Chromakey section ---------------
    float alpha = 0.0;
    
    if (Key_method == 0) // RGB Difference (Vlahos method)
    {
        // Standard RGB difference keying (green dominance approach)
        alpha = color.g - max(color.r, color.b);
        
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
        float Y2 = 0.299 * key_color_working.r + 0.587 * key_color_working.g + 0.114 * key_color_working.b;
        float U2 = ((key_color_working.b - Y2) * 0.565) + 0.5;
        float V2 = ((key_color_working.r - Y2) * 0.713) + 0.5;
        
        // Calculate color difference in YUV space
        float3 yuv_diff = abs(float3(Y, U, V) / float3(Y2, U2, V2) - 1.0);
        
        // Calculate alpha from color difference
        alpha = 1.0 - (key_tolerance_factor + 1.0) * max(yuv_diff.y, yuv_diff.z);
    }
    else // Hybrid method (combines RGB and YUV)
    {
        // RGB difference component
        float alpha_rgb = color.g - max(color.r, color.b);
        
        // YUV component
        float Y = 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;
        float U = ((color.b - Y) * 0.565) + 0.5;
        float V = ((color.r - Y) * 0.713) + 0.5;
        
        float Y2 = 0.299 * key_color_working.r + 0.587 * key_color_working.g + 0.114 * key_color_working.b;
        float U2 = ((key_color_working.b - Y2) * 0.565) + 0.5;
        float V2 = ((key_color_working.r - Y2) * 0.713) + 0.5;
        
        float3 yuv_diff = abs(float3(Y, U, V) / float3(Y2, U2, V2) - 1.0);
        float alpha_yuv = 1.0 - 2.0 * max(yuv_diff.y, yuv_diff.z);
        
        // Combine the two methods based on key tolerance
        alpha = lerp(alpha_rgb, alpha_yuv, key_tolerance_factor);
    }
    
    // Store the raw alpha for edge detection
    edge_matte.a = alpha;
    color.a = alpha;
    
    // --------------- Process highlights and shadows ---------------
    
    // Handle bright areas that should be keyed (like reflections)
    if (matte_highlights_factor > 0.0)
    {
        float highlight_diff = dot(color.rgb - key_color_working.rgb, float3(1.0, 1.0, 1.0));
        color.a -= matte_highlights_factor * saturate(highlight_diff);
    }
    
    // Handle dark areas that should be keyed (like shadows)
    if (matte_shadows_factor > 0.0)
    {
        float shadow_diff = dot((1.0 - color.rgb) - (1.0 - key_color_working.rgb), float3(1.0, 1.0, 1.0));
        color.a -= matte_shadows_factor * saturate(shadow_diff);
    }
    
    // Process black shadows separately (to add back as shadows)
    float black_shadow_alpha = 0.0;
    if (shadow_amount > 0.0)
    {
        // Calculate shadow area based on darker areas different from key color
        float shadow_diff = dot((1.0 - color.rgb) - (1.0 - key_color_working.rgb), float3(1.0, 1.0, 1.0));
        black_shadow_alpha = shadow_amount * saturate(shadow_diff);
        
        // Apply shadow gradient
        if (shadow_position != 0.0)
        {
            float screen_pos = v_in.uv.y;
            float gradient_pos = 0.5 + shadow_position;
            float t = clamp((screen_pos - (gradient_pos - shadow_softness)) / (2.0 * shadow_softness), 0.0, 1.0);
            black_shadow_alpha *= t;
        }
        
        // Apply shadow matte if available
        if (Use_shadow_matte)
        {
            float4 shadow_matte_color = Shadow_matte.Sample(textureSampler, v_in.uv);
            float shadow_mask = max(shadow_matte_color.r, max(shadow_matte_color.g, shadow_matte_color.b));
            black_shadow_alpha *= shadow_mask;
        }
    }
    
    // --------------- Apply matte controls ---------------
    
    // Apply black point adjustment (background cleanup)
    color.a = color.a * matte_black_factor;
    
    // Invert alpha for foreground/background logic
    color.a = 1.0 - color.a;
    
    // Apply white point adjustment (foreground opacity)
    color.a = saturate(color.a * matte_white_factor);
    
    // Apply hair detail enhancement
    float hair_detail_value = Hair_detail_enhance * 0.01;
    if (hair_detail_value > 0.0)
    {
        // Calculate luminance-based detail to find fine structures like hair
        float luma = dot(raw_color.rgb, float3(0.299, 0.587, 0.114));
        float key_luma = dot(key_color_working.rgb, float3(0.299, 0.587, 0.114));
        
        // Look for darker areas within partially transparent regions
        float detail_mask = saturate((key_luma - luma) * 2.0);
        
        // Only apply to edge areas
        float edge_area_mask = 1.0 - abs((color.a * 2.0) - 1.0);
        detail_mask *= edge_area_mask;
        
        // Enhance alpha in these potential hair/detail areas
        color.a = saturate(color.a + (detail_mask * hair_detail_value));
    }
    
    // Apply edge softness
    if (edge_softness_factor > 0.0)
    {
        // Calculate edge matte
        edge_matte.a = 1.0 - abs(color.a * 2.0 - 1.0); // Find edges (where alpha is around 0.5)
        edge_matte.a = pow(edge_matte.a, 2.0 - edge_softness_factor); // Adjust edge width based on softness
        
        // Soften the alpha at edges
        float softened_alpha = lerp(color.a, 0.5, edge_matte.a * edge_softness_factor);
        color.a = softened_alpha;
    }
    
    // Store edge matte for preview
    edge_matte.rgb = edge_matte.aaa;
    
    // --------------- Color processing for the foreground ---------------
    
    // Handle alpha and color adjustment
    if (color.a > 0.0)
    {
        if (color.a < 1.0)
        {
            // Apply premultiply setting for semi-transparent areas
            if (premultiply_factor < 1.0)
            {
                // Unpremultiply then repremultiply with custom factor
                color.rgb = lerp(raw_color.rgb / max(color.a, 0.001), raw_color.rgb, premultiply_factor);
            }
            else if (premultiply_factor > 1.0)
            {
                // Extra premultiplication for stronger alpha effect
                float extra = (premultiply_factor - 1.0);
                color.rgb = lerp(raw_color.rgb, raw_color.rgb * color.a, extra);
            }
            else
            {
                // At exactly 1.0, use raw color
                color.rgb = raw_color.rgb;
            }
        }
        else
        {
            // Fully opaque areas get raw color
            color.rgb = raw_color.rgb;
        }
    }
    
    // --------------- Spill removal ---------------
    
    // Create spill matte for preview
    spill_matte.rgb = float3(0.0, 0.0, 0.0);
    
    if (spill_reduction_factor > 0.0)
    {
        float spill_amount = 0.0;
        float spill_compare = 0.0;
        
        // Calculate how much to reduce spill based on the red-blue balance
        float spill_rb = lerp(color.r, color.b, spill_balance_factor);
        
        if (color.g > spill_rb)
        {
            // Calculate the amount of spill (green exceeding the red/blue)
            spill_amount = color.g - spill_rb;
            
            // Store spill matte for preview
            spill_matte.g = spill_amount;
            
            // Apply spill contrast
            if (spill_contrast_factor != 0.0)
            {
                spill_amount = lerp(spill_amount, pow(spill_amount, 2.0), spill_contrast_factor);
            }
            
            // Apply spill reduction
            color.g = lerp(color.g, spill_rb, spill_amount * spill_reduction_factor);
        }
        
        // Apply spill unpremultiply to edges
        if (spill_unpremultiply_factor > 0.0 && color.a < 0.99)
        {
            float edge_factor_value = (1.0 - color.a) * spill_unpremultiply_factor;
            color.rgb = safeColorCorrection(color.rgb, key_color_working.rgb, edge_factor_value * spill_amount);
        }
    }
    
    // --------------- Apply matte overlays ---------------
    
    // Apply garbage matte (exclude areas)
    if (Use_garbage_matte)
    {
        float4 garbage_color = Garbage_matte.Sample(textureSampler, v_in.uv);
        float garbage_mask = max(garbage_color.r, max(garbage_color.g, garbage_color.b));
        color.a = color.a - (1.0 - garbage_mask);
    }
    
    // Apply inside matte (include areas)
    if (Use_inside_matte)
    {
        float4 inside_color = Inside_matte.Sample(textureSampler, v_in.uv);
        float inside_mask = max(inside_color.r, max(inside_color.g, inside_color.b));
        color.a = color.a + inside_mask;
        
        // Preserve original color in inside matte areas if enabled
        if (Preserve_inside_color && inside_mask > 0.0)
        {
            color.rgb = lerp(color.rgb, raw_color.rgb, inside_mask);
        }
    }
    
    // Add shadow if enabled
    if (black_shadow_alpha > 0.0)
    {
        // Blend shadow with main alpha
        color.rgb = lerp(color.rgb, float3(0.0, 0.0, 0.0), black_shadow_alpha * (1.0 - color.a));
        color.a = saturate(color.a + black_shadow_alpha);
    }
    
    // --------------- Apply temporal filtering if enabled ---------------
    
    if (Enable_temporal && temporal_blend > 0.0)
    {
        float4 prev_frame = Last_frame.Sample(textureSampler, v_in.uv);
        
        // Blend current frame with previous frame
        color = lerp(color, prev_frame, temporal_blend);
    }
    
    // --------------- Apply color correction to final result ---------------
    
    // Apply color correction only to non-transparent areas
    if (color.a > 0.0)
    {
        // Apply edge defringing to remove green/blue tint from edges
        float defringe_value = Edge_color_remove * 0.01;
        if (defringe_value > 0.0)
        {
            // Find edge areas (partially transparent)
            float edge_defringe_value = (1.0 - color.a) * defringe_value;
            
            // Remove key color contamination from edge pixels
            float3 defringe_color = color.rgb;
            
            // Analyze key color channels to determine which to suppress
            float key_max = max(key_color_working.r, max(key_color_working.g, key_color_working.b));
            
            if (key_color_working.g > 0.4) // Green screen
            {
                // Suppress green, enhance red/blue
                float adjust = key_color_working.g / max(0.001, key_max);
                defringe_color.g *= (1.0 - (edge_defringe_value * adjust));
                defringe_color.rb *= (1.0 + (edge_defringe_value * 0.2));
            }
            else if (key_color_working.b > 0.4) // Blue screen
            {
                // Suppress blue, enhance red/green
                float adjust = key_color_working.b / max(0.001, key_max);
                defringe_color.b *= (1.0 - (edge_defringe_value * adjust));
                defringe_color.rg *= (1.0 + (edge_defringe_value * 0.2));
            }
            
            // Apply defringing
            color.rgb = lerp(color.rgb, defringe_color, edge_defringe_value);
        }
        
        // Convert to HSV for better color manipulation
        float3 hsv_final = rgb2hsv(color.rgb);
        
        // Apply hue shift
        hsv_final.x = frac(hsv_final.x + hue_adjustment);
        
        // Apply saturation
        hsv_final.y = saturate(hsv_final.y * saturation_adjustment);
        
        // Apply brightness
        hsv_final.z = saturate(hsv_final.z * (1.0 + brightness_adjustment));
        
        // Convert back to RGB
        color.rgb = hsv2rgb(hsv_final);
        
        // Apply contrast (after HSV adjustments)
        if (contrast_adjustment != 1.0)
        {
            float3 gray = float3(0.5, 0.5, 0.5);
            color.rgb = lerp(gray, color.rgb, contrast_adjustment);
        }
    }
    
    // Restore hue shift to match original video
    hsv_color = rgb2hsv(color.rgb);
    hsv_color.x = hsv_color.x - hue_offset;
    color.rgb = hsv2rgb(hsv_color);
    
    // Ensure zero alpha gives black RGB (prevents fringing)
    color.rgb *= color.a;
    
    // Handle preview modes
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
            color = prekey_color;
            color.a = 1.0;
            break;
        case 3: // Processed foreground
            color.a = 1.0;
            break;
        case 4: // Edge matte
            color = edge_matte;
            color.a = 1.0;
            break;
        case 5: // Spill matte
            color = spill_matte;
            color.a = 1.0;
            break;
    }
    
    return color;
}