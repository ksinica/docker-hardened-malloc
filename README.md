# ksinica/hardened-malloc

Docker Alpine-based image containing [hardened_malloc](https://github.com/GrapheneOS/hardened_malloc) from [Graphene OS](https://grapheneos.org).
Both `default` and `light` variants are built and placed under `/usr/local/lib/` directory:

- `/usr/local/lib/libhardened_malloc.so`
- `/usr/local/lib/libhardened_malloc-light.so`

This image can be used as a base image; in that case, it already has the `LD_PRELOAD` environment variable set to the path of `default` `hardened_malloc` variant.

## License

Source code is available under the MIT [License](/LICENSE).