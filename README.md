# Shell-based Dunnet Game

Implemeting an command user interface interactive game using by bash, csh, tcsh, awk and sed. <br>

## Installation

```sh
sudo apt install bash, csh, tcsh
```

## Step1. Creating Game Objects
* Objects (directory): 
	* Files: cabinet, palm, lamp, tree, emerald, shovel, coconut, coconuts, trees, tree, food, card, bin, bins, flashing, steady, key, boulder, board, cpu, vax, bear, computer, bracelet
	* File: .alerts
* Inventory (directory): 
	* File: lamp (Initialzation)

* Start (directory):
	* Directory: 8 kind of enter direction
		* n, s, w, e, ne, se, sw, nw
	* File: Object
		* shovel, bear, boulder, coconut, emerald, food, emerald, bracelet, vax, etc
	* File: 9 (line of output palying information)
	* Hidden Files:
		* .d
		* objects: `.key`, `.cpu`, `.board`, `.flashing`, `.card`

```sh
bash Step1:Creating-Objects/
```

## Step2. Running Dunnet Game using bash!

```sh
bash Step2:running/step2.sh
```
or <br>
```sh
./step2.sh
```

## Step3. Running Dunnet Game using by tcsh!

```sh
tcsh Step3:running/step3.sh
```

## Step4. Checking input validation using by sed
Need not input, input and running sed checking are in csh script.
```sh
csh Step4:Checking-Input-Validation-sed/testarg
```

## Step5. Checking input validation using by sed & awk

```sh
csh Step5:Checking-Input-Validation-awk/PA5.csh
```