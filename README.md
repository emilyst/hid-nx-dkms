`hid-nx` Linux kernel driver for Nintendo Switch controllers
=================================================================

This repository contains an alternative to the the Linux kernel `hid-nintendo` input driver called `hid-nx`. `hid-nx` has been modified to add support for [Nintendo Switch Online controllers](https://www.nintendo.com/switch/online-service/special-offers/).

For more information about the differences between this and the `hid-nintendo` driver included in the Linux kernel, see the ["History" section](#history) further down.


Source
------

[The source code for this driver can be found on GitHub.](https://github.com/emilyst/hid-nx-dkms)


Status
------

This driver should be considered **experimental**.

It ought to be stable enough for day-to-day use. However, its various features, inputs, device names, and so on may still be subject to change.


Supported controllers
---------------------

This driver supports these Nintendo Switch Online controllers:

* [SNES controller for Nintendo Switch Online](https://www.nintendo.com/store/products/super-nintendo-entertainment-system-controller/)
* [NES Joy-Con controllers for Nintendo Switch Online](https://www.nintendo.com/store/products/nintendo-entertainment-system-controllers/)
* [Sega Genesis control pad for Nintendo Switch Online](https://www.nintendo.com/store/products/sega-genesis-control-pad/)
* [Nintendo 64 controller for Nintendo Switch Online](https://www.nintendo.com/store/products/nintendo-64-controller/)

Note that this does **not** include controllers for the "Classic" consoles released by Nintendo.

This driver also continues to support devices implemented by the original driver:

* Nintendo Switch Joy-Cons (separately, [together](#combining-joy-con-devices), or in a charging grip)
* Nintendo Switch Pro Controller


Supported Linux kernel versions
-------------------------------

This driver should work with Linux kernel versions 5.16 or greater.


Installation
------------

If you are installing on Arch Linux, this driver [can be built and installed as a package](#arch-linux-package-installation). This is recommended. Otherwise, [see the DKMS installation instructions](#from-source-using-dkms).

Once installed, this driver replaces the native `hid-nintendo` driver. No other configuration should be necessary.

DKMS will be responsible for automatically rebuilding the driver for every kernel you install in the future.


### As a package on Arch Linux

On Arch Linux, instead of installing from source directly, it is possible to build and install the module as a package. This is helpful because the Pacman packaging system will be aware of it. (Note, though, that even if you install as a package, the [DKMS](https://wiki.archlinux.org/title/Dynamic_Kernel_Module_Support) system is still used to manage the module.)

Run the following command *without* using root permissions. Once the package is built, you will be asked to confirm and authenticate for the package installation.

    makepkg --clean --cleanbuild --syncdeps --force --install


### From source using DKMS

To install this driver from source on Linux, use [DKMS](https://github.com/dell/dkms). The process is described below.

Before installation, you should install DKMS support. Depending on which Linux distribution you use, you can run one of the following commands as root or using `sudo`:

* On Debian, Ubuntu, or Mint:   `apt-get install dkms`
* On Fedora:                    `dnf install dkms`
* On Arch Linux:                `pacman -S dkms`

Next, clone the source code.

    git clone https://github.com/emilyst/hid-nx-dkms
    cd hid-nx

Then run the following commands as root or using `sudo`.

    dkms add .
    dkms build hid-nx -v 1.11
    dkms install hid-nx -v 1.11


Uninstallation
--------------

To remove fully, run the following commands as root or using `sudo`.

    modprobe -r hid_nx
    dkms uninstall -m hid-nx -v 1.11
    dkms remove -m hid-nx -v 1.11
    rm -rf /usr/src/hid-nx-*


Combining Joy-Con devices
-------------------------

Neither the `hid-nintendo` driver nor the `hid-nx` driver will present two connected Joy-Con controllers as a single device. A userspace daemon called [`joycond`](https://github.com/DanielOgorchock/joycond) provides this functionality. Install it and follow its instructions.

Arch Linux users can install [`joycond-git` from the Arch Linux User Repository](https://aur.archlinux.org/packages/joycond-git).

At this time, [I recommend adding workaround udev rules](99-joycond-ignore.rules) to prevent `joycond` from interacting with the NSO controllers. To do so, copy [`99-joycond-ignore.rules`](99-joycond-ignore.rules) to `/etc/udev/rules.d/`. Then run:

    sudo udevadm control --reload


Planned
-------

* Refactors to break apart longer functions
* Possible ideas from `linux-rt`:
  * Replace kernel spinlocks with mutexes that support priority inheritance
  * Move all interrupt and software interrupts to kernel threads
* Possibly add more `unlikely` macros to error conditions
* Amend commits to add `Signed-Off-By` for my own work


History
-------

This driver was originally taken from the source code [from `drivers/hid/hid-nintendo.c` at Linux kernel commit `3e732ebf7316ac83e8562db7e64cc68aec390a18`](https://github.com/torvalds/linux/blob/3e732). That driver source was first written by Daniel Ogorchock. [His Linux kernel fork can be found on GitHub.](https://github.com/DanielOgorchock/linux)

I then manually incorporated [changes from Nadia Holmquist Pedersen to support SNES and NES controllers from Nintendo Switch Online](https://github.com/nadiaholmquist/linux/tree/hid-nintendo).

After that, I extended this support to the Sega Genesis gamepad and [proposed it as a change to Daniel's tree](https://github.com/DanielOgorchock/linux/pull/35).

Once I saw there were more changes I wanted to make, I decided to share them as a separate out-of-tree kernel driver instead.

Along with Sega Genesis gamepad support, I've also added support for the Nintendo 64 controller for Nintendo Switch Online.

I've also renamed the driver to `hid-nx` to avoid confusion with the in-kernel module.


License
-------

    HID driver for Nintendo Switch Joy-Cons and Pro Controllers

    Copyright (c) 2019-2021 Daniel J. Ogorchock <djogorchock@gmail.com>
    Portions Copyright (c) 2020 Nadia Holmquist Pedersen <nadia@nhp.sh>
    Copyright (c) 2022 Emily Strickland <linux@emily.st>

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
    02110-1301, USA.
