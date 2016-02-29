## Hello World!

In this tutorial we will learn how to load a simple **hello world** script into our NodeMCU devkit board using the [esp cli tool][node-esp].

You should follow the [introductory tutorial][intro-tutorial] to get your Mac environment ready.

Once we have completed this tutorial we should be able to write our own programs and upload them to a NodeMCU board. There will be also a minimal introduction to strings in the Lua programming language.

---

### Code

The actual program we are going to write is rather simple. The main focus is the process to get code running in the board. We will use the [esp cli tool][node-esp] to upload and execute a file.

In the spirit of [hello world][hw], here is our very first program:

```lua
print("Hello, World!")
```

The `print` statement takes a string parameter and will output it to the console, in this case the string "Hello World!". Below you can find some information about [strings in Lua](#lua-strings).

#### Create a new file

Create a new file, type our glorious program:
```lua
print("Hello, World!")
```
 Name it `hello_world.lua` and save it to the **code** directory. To upload the file to the board we will be using the [esp cli tool][node-esp]. If you have not installed it yet you can follow the instructions on the tool's [repository][node-esp].

To upload the file to the board we will issue the following commands in a terminal window. `cd` to the directory where you saved the `hello_world.lua` file, and from there execute:

```
$ esp file write hello_world.lua
```

You can peek the contents of the file system with the following command:

```
$ esp file list
```

To see a list of the `esp file` subcommands type the `esp file --help` command to display the help content.

#### Executing a file

Now we are going to execute our program.

```
$ esp file execute hello_world.lua
```
Your terminal window should show the following text:
```
Hello, World!
```

#### Lua Strings

In Lua you use two dots to concatenate strings,
```lua
print("Hello, ".."World!")
```
You could also use variables. If you assign a string value to a variable, you could dynamically create a string:

```
local name = "Peperone"
print("Hello "..name.."!") -- outputs: Hello Peperone!
```

If we want to interpolate variables in a string, it can get unwieldy pretty fast:
```lua
local name = "Peperone"
local something = "pancakes"
print("Hello "..name..", do you like "..something.."?")
-- outputs: Hello Peperone, do you like pancakes?
```

In lua you can do [string interpolation][wiki-string-interpolation] using the `string.format` utility- you can read about it  [here][wiki-lua-string-interpolation]. But basically...

> String interpolation is the process of evaluating a string literal containing one or more placeholders, yielding a result in which the placeholders are replaced with their corresponding values.

```lua
local name = "Peperone"
local something = "pancakes"
print(string.format("Hello %s, do you like %s?", name, something))
-- outputs: Hello Peperone, do you like pancakes?
```

#### Multiline
In Lua you can also have multiline strings using the `[[` characters to open a multiline sequence, and the `]]` characters to close it.


```lua
conn:send([[<h2>The module MAC address is: ]].. ap_mac..[[</h2>
    <h2>Enter SSID and Password for your WIFI router</h2>
    <form action='' method='get' accept-charset='ascii'>
    SSID:
    <input type='text' name='SSID' value='' maxlength='32' placeholder='your network name'/>
    <br />
    Password:
    <input type='text' name='PASS' value='' maxlength='100' placeholder='network password'/>
    <br/>
    <input type='submit' value='Submit' />
    </form> </body> </html>]])
```



[silabs-drivers]: https://www.silabs.com/products/mcu/Pages/USBtoUARTBridgeVCPDrivers.aspx
[intro-tutorial]: https://github.com/goliatone/wee-things-workshop

[dofile-tutorial]: http://luatut.com/dofile.html
[dofile]: http://www.lua.org/pil/8.html

[wiki-lua-string-interpolation]: http://lua-users.org/wiki/StringInterpolation
[wiki-string-interpolation]: https://en.wikipedia.org/wiki/String_interpolation


<!--
//stackoverflow.com/questions/31304082/how-to-recover-nodemcu-infinite-loop
-->

[node-esp]: https://www.npmjs.com/package/node-esp
[hw]: https://en.wikipedia.org/wiki/%22Hello,_World!%22_program
[atom]: https://atom.io
