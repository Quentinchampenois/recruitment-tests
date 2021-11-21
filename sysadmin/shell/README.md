## Shell scripting 

### Firstnames counter

**Instructions:**

For a given file named `examples.txt`, find the most present firstname in the list, with the number of times it appears.

If the file is missing, a message must be print and program must exit with a non-zero status code.

**Expectations:**

When I run the shell script with the filename as parameter
Program should output the firstname with the number of times

Example :
```bash
$ ./firstnames.sh examples.txt
output:
Firstname 'Julie' appeared 6 times
```

When the filename is not defined as first parameter  
It should output an error message  
And if the filename is given as paremeter  
And file is not found  
It should output an error message  

```bash
$ ./firstnames.sh
output:
File not found
Program exiting...
```

**Hint:** 
* Your script must have the execution rights
* You can use functions
