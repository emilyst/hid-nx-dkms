`hid-nintendo` Linux kernel driver with NSO controller support
==============================================================

This repository contains an alternative version of the Linux kernel `hid-nintendo` input driver, modified to add support for Nintendo Switch Online controllers.

For more information about the differences between this and the driver included in the Linux kernel, see the ["History" section] further down.


Source
------

[The source code for this driver can be found on GitHub.]


Status
------

This driver should be considered **experimental**.

It ought to be stable enough for day-to-day use. However, its various features, inputs, device names, and so on may still be subject to change.


Supported controllers
---------------------

This driver supports these Nintendo Switch Online controllers:

* [SNES controller] for Nintendo Switch Online
* [NES Joy-Con controllers] for Nintendo Switch Online
* [Sega Genesis control pad] for Nintendo Switch Online
* [Nintendo 64 controller] for Nintendo Switch Online

Note that this does **not** include controllers for the "Classic" consoles released by Nintendo.

This driver also continues to support devices implemented by the original driver:

* Nintendo Switch Joy-Cons (separately, together, or in a charging grip)
* Nintendo Switch Pro Controller


Supported Linux kernel versions
-------------------------------

This driver should work with Linux kernel versions 5.16 or greater.


Installation
------------

This driver can be installed from source on Linux using DKMS. (If you're installing on Arch Linux, see "Arch Linux package installation" below.)

Before installation, you should install DKMS support. Depending on which Linux distribution you use, you can run one of the following commands as root or using `sudo`:

* On Debian, Ubuntu, or Mint:   `apt-get install dkms`
* On Fedora:                    `dnf install dkms`
* On Arch Linux:                `pacman -S dkms`

Next, clone the source code.

    git clone https://github.com/emilyst/hid-nintendo
    cd hid-nintendo

Then run the following commands as root or using `sudo`.

    dkms add .
    dkms build hid-nintendo -v 1.8
    dkms install hid-nintendo -v 1.8

Once installed, this driver replaces the native `hid-nintendo` driver. No other configuration should be necessary.

The driver will be rebuilt automatically for every kernel you install in the future. For more information about DKMS, see [the DKMS Arch Linux documentation].

If you want to use two Joy-Cons together as a single input, see [`joycond`].


Uninstallation
--------------

To remove fully, run the following commands as root or using `sudo`.

    modprobe -r hid_nintendo
    dkms uninstall -m hid-nintendo -v 1.8
    dkms remove -m hid-nintendo -v 1.8
    rm -rf /usr/src/hid-nintendo-*


Arch Linux package installation
-------------------------------

On Arch Linux, instead of installing from source, it is possible to build and install the module as a package. Run the following command *without* using root permissions. You will be asked to confirm the package installation.

    makepkg --clean --cleanbuild --syncdeps --install --force

[`joycond`] can be installed [from the Arch Linux User Repository].


Planned
-------

* Refactors to break apart longer functions
* Possibly rename module to avoid confusion and clarify scope
  * e.g. `hid-nx`
* Possible ideas from `linux-rt`:
  * Replace kernel spinlocks with mutexes that support priority inheritance
  * Move all interrupt and software interrupts to kernel threads
* Possibly add more `unlikely` macros to error conditions
* Amend commits to add `Signed-Off-By` for my own work


History
-------

This driver was originally taken from the source code [from `drivers/hid/hid-nintendo.c` at Linux kernel commit `3e732ebf7316ac83e8562db7e64cc68aec390a18`]. That driver source was first written by Daniel Ogorchock. [His Linux kernel fork can be found on GitHub.]

I then manually incorporated [changes from Nadia Holmquist Pedersen to support SNES and NES controllers from Nintendo Switch Online].

After that, I extended this support to the Sega Genesis gamepad and [proposed it as a change to Daniel's tree].

Once I saw there were more changes I wanted to make, I decided to share them as a separate out-of-tree kernel driver instead.

Along with Sega Genesis gamepad support, I've also added support for the Nintendo 64 controller for Nintendo Switch Online.


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


["History" section]: #history
[The source code for this driver can be found on GitHub.]: https://github.com/emilyst/hid-nintendo
[SNES controller]: https://www.nintendo.com/store/products/super-nintendo-entertainment-system-controller/
[NES Joy-Con controllers]: https://www.nintendo.com/store/products/nintendo-entertainment-system-controllers/
[Sega Genesis control pad]: https://www.nintendo.com/store/products/sega-genesis-control-pad/
[Nintendo 64 controller]: https://www.nintendo.com/store/products/nintendo-64-controller/
[the DKMS Arch Linux documentation]: https://wiki.archlinux.org/title/Dynamic_Kernel_Module_Support
[`joycond`]: https://github.com/DanielOgorchock/joycond
[from the Arch Linux User Repository]: https://aur.archlinux.org/packages/joycond-git
[from `drivers/hid/hid-nintendo.c` at Linux kernel commit `3e732ebf7316ac83e8562db7e64cc68aec390a18`]: https://github.com/torvalds/linux/blob/3e732
[His Linux kernel fork can be found on GitHub.]: https://github.com/DanielOgorchock/linux
[changes from Nadia Holmquist Pedersen to support SNES and NES controllers from Nintendo Switch Online]: https://
[proposed it as a change to Daniel's tree]: https://github.com/DanielOgorchock/linux/pull/35
