## Init File


### Creating a new file

We will create a new file, and name it `init.lua`. This is a very special file, because every time when the board boots it will look for a file named `init.lua` and it will automatically execute it.

Because of this, we need to be very careful to not upload a `init.lua` file that generates any **panic** errors. This would cause the board to reboot. Once booted it will enter a panic reboot infinite loop bricking the board.

It's recommended to keep `init.lua` files really simple and add a guard using a timer. We will cover that up later on.
