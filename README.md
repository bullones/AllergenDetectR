# AllergenDetectR

R workflow to detect new pollen allergens

***

## Table of contents

* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Components](#components)
* [Configuration](#configuration)
* [Input files](#input-files)
* [Output files](#output-files)
* [Citation](#citation)
* [License](#license)

***

## Prerequisites

Previous to the execution of this script, you need to download the two databases needed:

1. _Study organism allergens DB_: All the study organism protein sequences available in [UniProt](https://www.uniprot.org/) that have at least one cross reference to the [Allergome](https://www.uniprot.org/) database.
	1. Go to <https://www.uniprot.org/>.
	1. In the search toolbar select "Advanced".
	1. Fill the form:
	![alt text](olive_allergens_DB.png)
	1. Download the FASTA file with the protein sequences.
1. _Non-study organism allergens DB_.
	1. Go to <https://www.uniprot.org/>.
	1. In the search toolbar select "Advanced".
	1. Fill the form:
	![alt text](non_olive_allergens_DB.png)
	1. Download the FASTA file with the protein sequences.
1. You will also need to download DIAMOND software following the GitHub instructions: <https://github.com/bbuchfink/diamond/wiki>.

***

## Installation

You will need a local copy of the GitHub _AllergenDetectR_ repository on your machine. It can be done using git in the shell:

```bash
git clone git@github.com:bullones/AllergenDetectR.git
```

Alternatively, you can go to <https://github.com/bullones/AllergenDetectR/> and click on _Code_ button and then _Clone_, or select _Download ZIP_ or any other possibility you prefer. The cloned of unzipped directory `AllergenDetectR` should be placed somewhere on your `$HOME` in Linux, macOS and Windows.

Then you can navigate inside _AllergenDetectR_ using shell comands or window interface.

***

## Components

***

## Configuration

***

## Input files

***

## Output files

Each execution of _AllergenDetectR_ create a separate folder at the `WD_DIR` folder. The new folder will be called:

> `results_{FASTA_TYPE}_{DATATIME}`

where `{FASTA_TYPE}` indicates the type of DIAMOND that has been launched (blastp for proteins and blastn for nucleotides), and `{DATATIME}` is the date and time of execution to guarantee that a different folder is created on every execution.

The folder will contain:

* An interactive **HTML report** called ` Report.html` with the results and explanation of each saved file.
* **Eight tables in `tsv` format** for DIAMOND results (before and after filtering).
	+ `diamond_allergens.tsv`:
	+ `diamond_allergens_filtered.tsv`:
	+ `diamond_{SP}.tsv`:
	+ `diamond_{SP}_filtered.tsv`:
	+ `diamond_{SP}_known_allergens.tsv`:
	+ `diamond_{SP}_known_allergens_filtered.tsv`:
	+ `diamond_no_{SP}.tsv`:
	+ `diamond_no_{SP}_filtered.tsv`:
* **Three FASTA files** to save the protein of interest sequences.
	+ `proteins_isoforms.fasta`:
	+ `proteins_new_allergens.fasta`:
	+ `proteins_with_allergen.fasta`:
* **Two FASTA files** to save the proteins that are known allergens of the study organism, and those that are not known allergens of the study organism.
	+ `proteome_pollen_{SP}_known_allergens.fasta`:
	+ `proteome_pollen_no_{SP}_known_allergens.fasta`:
* **Two DIAMOND-formated databases** needed for the DIAMOND analyses.
	+ `allergens_{SP}_db.dmnd`:
	+ `allergens_no_{SP}_db.dmnd`:
* **One DIAMOND error file** to track possible errors.
	+ `diamond.err`:

where `{SP}` indicates the study organism.

***

## Citation

Please, reference this pipeline and its documentation as follows:

***

## License

![](https://licensebuttons.net/l/by/3.0/88x31.png)
[CC-BY](https://creativecommons.org/licenses/by/4.0/)

**Authors**: Amanda Bullones, M. Gonzalo Claros and Rosario Carmona

Any concern, suggestion, bug or whatelse can be addressed to [Amanda Bullones](mailto:amandabullones@uma.es)
