// Import generic module functions
include { initOptions; saveFiles; getSoftwareName } from './functions'

params.options = [:]
options        = initOptions(params.options)

/*
 * Predict the liver-tumor segmentation of an abdominal CT volume centered around the liver.
 * Using the MRC format.
 */
process UNET_PRED {
    publishDir "${params.outdir}",
        mode: params.publish_dir_mode,
        saveAs: { filename -> saveFiles(filename:filename, options:params.options, publish_dir:'pipeline_info',
        publish_id:'') }

    container "luiskc/liverctseg:dev"

    cache false

    input:
    path mrc_file

    output:
    stdout emit: console_out
    path '*.mrc', emit: all_mrc

    //TO-DO:
    //liver-ct-seg-uncert -i $mrc_file -o ./ -t 2
    //liver-ct-seg-feat-ggcam -i $mrc_file -o ./ -t 2 -f _feat_vol_2.mrc

    script:
    """
    echo $mrc_file
    liver-ct-seg-model-dl
    liver-ct-seg-pred -i $mrc_file -o ./
    
    """
    

}

