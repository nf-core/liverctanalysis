#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/liverctanalysis
========================================================================================
    Github : https://github.com/nf-core/liverctanalysis
    Website: https://nf-co.re/liverctanalysis
    Slack  : https://nfcore.slack.com/channels/liverctanalysis
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

//params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

//WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { LIVERCTANALYSIS } from './workflows/liverctanalysis'

//
// WORKFLOW: Run main nf-core/liverctanalysis analysis pipeline
//
workflow NFCORE_LIVERCTANALYSIS {
    LIVERCTANALYSIS ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_LIVERCTANALYSIS ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
