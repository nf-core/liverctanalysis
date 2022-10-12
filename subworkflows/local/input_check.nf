//
// Check input
//

params.options = [:]

include { SAMPLESHEET_CHECK } from '../../modules/local/samplesheet_check' addParams( options: params.options )

workflow INPUT_CHECK {
    take:
    samplesheet // file: /path/to/samplesheet.csv

    main:
    SAMPLESHEET_CHECK ( samplesheet )
        //.splitCsv ( header:true, sep:',' )
        //.map { create_fastq_channels(it) }
        .set { reads }

    emit:
    reads // channel: [ val(meta), [ reads ] ]
}
