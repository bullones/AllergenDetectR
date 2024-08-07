<div style="text-align: justify">
# AllergenDetectR

R workflow to detect new pollen allergens

***

## First step

Previous to the execution of this script, you need to download the two databases needed:

1. <i>Study organism allergens DB</i>: All the study organism protein sequences available in [UniProt](https://www.uniprot.org/) that have at least one cross reference to the [Allergome](https://www.uniprot.org/) database.
	1. Go to <https://www.uniprot.org/>.
	1. In the search toolbar select "Advanced".
	1. Fill the form:
	![alt text](olive_allergens_DB.png)
	1. Download the FASTA file with the protein sequences.
1. <i>Non-study organism allergens DB</i>.
	1. Go to <https://www.uniprot.org/>.
	1. In the search toolbar select "Advanced".
	1. Fill the form:
	![alt text](non_olive_allergens_DB.png)
	1. Download the FASTA file with the protein sequences.
1. You will also need to download DIAMOND software following the GitHub instructions: <https://github.com/bbuchfink/diamond/wiki>.
</div>
