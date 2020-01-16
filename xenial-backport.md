# NAME

xenial-backport

# DESCRIPTION

The process below outlines how to backport a package from Debian or a newer
Ubuntu release back to Ubuntu Xenial.

1.  Go through the Getting Set Up [1] page in the Ubuntu Packaging Guide. Among
    other things, this will set up the GPG and SSH keys as well as installing
    and setting up the necessary tools (such as pbuilder)

2.  Use **dget(1)** to download the `.dsc` file for the package you want to
    backport. For example, to backport **isync** from Debian:
    
        dget https://deb.debian.org/debian/pool/main/i/isync/isync_1.3.0-2.dsc

3.  This should download both the source code archive as well as an archive of
    the Debian packaging files. Extract both of them and move the _debian_
    directory into the source tree:
    
        tar xzf isync_1.3.0.orig.tar.gz
        tar xJf isync_1.3.0-2.debian.tar.xz
        mv debian isync-1.3.0/

4.  Navigate into the package source tree and update the files under the
    `debian` subdirectory. For Ubuntu Xenial, the `debhelper` requirement must
    be set to `>= 9` in the `debian/control` file. Additionally, there must be
    a `debian/compat` file with only the contents `9`.

5.  Create a new entry in the `changelog` file. While in the package's source
    tree, run
    
        dch --local ppa~xenial --distribution xenial "No-change rebuild from <source distribution> to xenial"
    
    This will create a new entry in `debian/changelog`, which you can verify.

6.  Build the package using `debuild` from within the source tree. Ignore any
    errors you might see about failing to sign the package (we'll handle that
    later). If the package builds successfully, you should have a new `.dsc`
    file in the parent directory:
    
        $ ls ../isync_1.3.0-2ppa~xenial1.dsc
        isync_1.3.0-2ppa~xenial1.dsc
    
7.  Use `pbuilder-dist` to build the package. `pbuilder` creates a sandboxed
    version of your target distribution to test the build process.
    
        cd ..
        pbuilder-dist xenail build isync_1.3.0-2ppa~xenial1.dsc

8.  If this succeeds, navigate back to the source tree and build the signed
    version of the package.
    
        cd isync-1.3.0
        debuild -S
    
    If you get an error that clearsign failed because the secret key is not
    available, include your key ID (available through **gpg(1)**) in the
    command:
    
        debuild -S -k<keyID>

9. Finally, use **dput(1)** to upload your package to your PPA:
    
        dput ppa:gpanders/xenial-backports isync_1.3.0-2ppa~xenial1.dsc
    
    If the upload is successful, you will get an email saying your upload was
    approved.

# REFERENCES

1.  <http://packaging.ubuntu.com/html/getting-set-up.html>
2.  <https://blog.g3rt.nl/create-backport-package-ppa.html>
