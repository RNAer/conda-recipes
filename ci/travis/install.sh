case "${TRAVIS_OS_NAME}" in
    osx)
        os="MacOSX"
        ;;
    linux)
        os="Linux"
        ;;
    *)
        os="Unknown"
esac

MINICONDA_URL="http://repo.continuum.io/miniconda"
MINICONDA_FILE="Miniconda3-latest-${os}-x86_64.sh"
wget "${MINICONDA_URL}/${MINICONDA_FILE}"
bash $MINICONDA_FILE -b -p $HOME/miniconda

export PATH=$HOME/miniconda/bin:$PATH
hash -r
conda config --set always_yes yes --set changeps1 no
conda update -q conda
conda install pip conda-build anaconda-client
# Useful for debugging any issues with conda
conda info -a

# Add channel to get boost libraries. Probably want to "self-host",
# maybe embedding their recipes as a git module?
conda config --add channels menpo
