# Vcpkg Repository
This is a forked repository of Color-Glass software and related third-party libraries for use with Vcpkg.

## Use in Manifest Mode
To add to your project create a file in the root of your project (next to `vcpkg.json`) called
`vcpkg-configuration.json`. Add the following to that file:

```json
{
  "registries": [
    {
      "kind": "git",
      "repository": "https://gitlab.com/colorglass/vcpkg-colorglass",
      "baseline": "70edd3a6927bb508e8fa06f55c750a86e407a065",
      "packages": [
        "articuno",
        "bethesda-fallout4-scripts",
        "bethesda-skyrim-scripts",
        "commonlibf4"
        "commonlibsse",
        "commonlibsse-ng",
        "commonlibsse-ng-fork",
        "commonlibsse-ng-ae",
        "commonlibsse-ng-flatrim",
        "commonlibsse-ng-prebuilt",
        "commonlibsse-ng-se",
        "commonlibsse-ng-vr",
        "commonlibsse-po3-ae",
        "commonlibsse-po3-se",
        "commonlibvr",
        "f4se",
        "fully-dynamic-game-engine",
        "gluino",
        "hoshi",
        "script-extender-common",
        "skse",
        "tsl-hat-trie"  
      ]
    }
  ]
}
```

Any packages that will not be used can be removed from the packages list. If you already have a
`vcpkg-configuration.json` file you can add the registry definition to your existing registries list.

## Use in Classic Mode
To use the registry in classic mode is identical to using it in manifest mode, however the `vcpkg-configuration.json`
file to use will be located in your Vcpkg root directory rather than your project directory.

## Available Ports
### Skyrim Development Ports ###
#### CommonLibSSE ####
Several ports provide variants of CommonLibSSE, a static library for developing Skyrim SKSE plugins. The `commonlibsse` package builds the [official upstream version of CommonLibSSE](https://github.com/Ryan-rsm-McKenzie/CommonLibSSE). This package currently can only target Skyrim runtimes from post-Anniversary Edition era. `commonlibvr` is a [fork which is created specifically for Skyrim VR](https://github.com/alandtse/CommonLibVR). Note that upstream CommonLibSSE is not versioned, so the versioning for these packages are the date of the latest commit at the time the port is updated. The popular [fork of CommonLibSSE by powerof3](https://github.com/powerof3/CommonLibSSE) is also supported. This fork has some additional content and can be compiled to support either AE or SE versions of Skyrim. To use its AE build, use the port `commonlibsse-po3-ae`. The SE build is available as `commonlibsse-po3-se`.

`commonlibsse-ng` provides the Skyrim NG project's fork of CommonLibSSE ([CommonLibSSE NG](https://github.com/CharmedBaryon/CommonLibSSE-NG)). This tracks the upstream changes, but keeps the support for pre-AE Skyrim runtimes (commonly called simply "SE"), as well as adding full support for VR. This version of CommonLibSSE can make a runtime determination of which Skyrim executable is in use, allowing SKSE plugins that work across AE, SE and VR in one build. For versions optimized for (but only supporting) one runtime, you can use `commonlibsse-ng-ae` or `commonlibsse-ng-se`. `commonlibsse-ng-vr` provides a VR-specific build, which provides direct access to all features from CommonLibVR. A version that excludes VR support but supports both AE and SE with a single build is available as `commonlibsse-ng-flatrim`. To learn more about handling multiple Skyrim runtime targets with CommonLibSSE NG, [read its README](https://github.com/CharmedBaryon/CommonLibSSE-NG/blob/feature/vr-support/README.md#targeting-multiple-runtimes). Unlike the other forks, CommonLibSSE NG uses semantic version numbers, starting with version `1.0.0`, and is intended to only ever be used from cut releases distributed from this repository.

`commonlibsse-ng-fork` is a forked project of CommonLibSSE NG that contains many enhancements to VR as well as updates to the NG branch, while maintaining the same benefits of the origin `commonlibsse-ng` library. It is recommended to be used for developers that need a more recently updated version of CommonLibSSE NG (as of 13-07-2024).

Depending on your hardware, CommonLibSSE may take significant compile time. To save time you can use prebuilt versions of CommonLibSSE NG with the `commonlibsse-ng-prebuilt` package. This is available only for static linkage, in both static and dynamic CRT linkage versions. However, dynamic CRT linkage (e.g. with the `x64-windows-static-md` triplet) is strongly recommended for maximum compatibility.

#### Fully Dynamic Game Engine ####
[Fully Dynamic Game Engine](https://gitlab.com/colorglass/fully-dynamic-game-engine) (FuDGE) is a framework for development of Skyrim mods, including C++ SKSE plugins, Python SKSE plugins, Dymods, and enhanced Papyrus scripts. For C++ projects it enables more structured project development and a cleaner separation of concerns in large projects by providing an inversion of control style. It is available with the `fully-dynamic-game-engine-component`.

FuDGE is available with 3 features, `trueflame`, `black-book`, and `hopesfire`. Trueflame is a static library for enhanced C++ project structure, and imposes no end-user dependencies. Black Book is FuDGE's shared library component, and offers more features such as Papyrus script objects, custom console commands, dymods, and a form database for reverse lookup of links between forms. Using it adds the requirement that end users of your project have installed Fully Dynamic Game Engine themselves into their mod list. Hopesfire is a second static library, which itself dynamically links to Black Book. It provides enhanced interfaces to Black Book. It is recommended that if you want the shared library functions of FuDGE, you simply link to Hopesfire rather than Black Book directly.

Fully Dynamic Game Engine is available in prebuilt form with the `fully-dynamic-game-engine-prebuilt` port, with both static and dynamic CRT linkage. Dynamic linkage is strongly encouraged (e.g. with the `x64-windows-static-md` triplet) for maximum compatibility on it's statically-linked components, Trueflame and Hopesfire.

#### SKSE ####
[SKSE itself](https://github.com/ianpatt/skse64) can be built using this repository, if you wish to develop against it directly or need to include Papyrus development in your project and need its script sources. The `skse` package provides a build of the latest SKSE64 version. It includes two package features: `plugin` and `scripts`. The former builds the DLLs for SKSE, and the later will extract SKSE's extended versions of the Skyrim Papyrus script sources to a `contrib/papyrus/skse` directory under your `vcpkg_installed` folder, allowing their use in Papyrus development.

#### Bethesda Skyrim Papyrus Sources ####
The `bethesda-skyrim-scripts` package will extract the vanilla Skyrim script sources to `contrib/papyrus/skyrim` under your `vcpkg_installed` folder. For licensing reasons these cannot be redistributed. This package requires you to have Skyrim Special Edition
or Skyrim VR installed, and to have run it at least once to initialize the registry information for the install. The port will find the install directory from the registry to extract the sources.

### Fallout 4 Development ###
#### CommonLibF4 ####
The `commonlibf4` port will build the latest version of CommonLibF4, a static library for development of F4SE plugins.

#### F4SE ####
F4SE can be built with the `f4se` package. It provides two features, `plugin` to build the plugin and loaders themselves, and `scripts` to extract the Fallout 4 version of the Fallout 4 script sources to `contrib/papyrus/f4se` under your `vcpkg_installed` directory.

#### Bethesda Fallout 4 Papyrus Sources ####
The `bethesda-fallout4-scripts` package will extract the vanilla Fallout 4 script sources to `contrib/papyrus/fallout4` under your `vcpkg_installed` folder. For licensing reasons these cannot be redistributed. This package requires you to have Fallout 4 installed, and to have run it at least once to initialize the registry information for the install. The port will find the install directory from the registry to extract the sources.

### Other Libraries
* `articuno`: A next-generation, high-performance, feature-rich serialization framework for C++20 and later.
* `gluino`: A modern general utility header-only library for C++20 and later development.
* `hoshi`: A modern header-only, template-based localization system for C++20 and later.
* `script-extender-common`: A utility library, used by SKSE and F4SE.
* `tsl-hat-trie`: A highly efficient trie implementation, used in Fully Dynamic Game Engine.

#### Prebuilt Libraries
To save development time several libraries are available in prebuilt form.
* `python3-prebuilt`: A prebuilt Python 3 port.
* `pybind11-prebuilt`: A prebuilt Pybind11 library, based on the prebuilt Python 3 port.
* `qtbase-prebuilt`: A prebuilt version of Qt 6 core; this is available only for dynamic linkage (although the Qt libraries themselves are compiled with static linkage) and with dynamic CRT linkage.
* `qtdeclarative-prebuilt`: A prebuilt version of Qt 6 Quick 2; this is available only for dynamic linkage (although the Qt libraries themselves are compiled with static linkage) and with dynamic CRT linkage.
* `qtimageformats-prebuilt`: A prebuilt version of Qt 6 image format plugins; this is available only for dynamic linkage (although the Qt libraries themselves are compiled with static linkage) and with dynamic CRT linkage.
* `qtmultimedia-prebuilt`: A prebuilt version of Qt 6 multimedia support; this is available only for dynamic linkage (although the Qt libraries themselves are compiled with static linkage) and with dynamic CRT linkage.
* `qtsvg-prebuilt`: A prebuilt version of Qt 6 SVG plugins; this is available only for dynamic linkage (although the Qt libraries themselves are compiled with static linkage) and with dynamic CRT linkage.
* `qtwebengine-prebuilt`: A prebuilt version of Qt 6 Web Engine; this is available only for dynamic linkage (although the Qt libraries themselves are compiled with static linkage) and with dynamic CRT linkage.
* `qtwebview-prebuilt`: A prebuilt version of the Qt 6 Web View controls; this is available only for dynamic linkage (although the Qt libraries themselves are compiled with static linkage) and with dynamic CRT linkage.
