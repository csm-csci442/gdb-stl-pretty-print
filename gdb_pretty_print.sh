TMPDIR=$(mktemp -d)
GDB_PY_PRETTY_PRINT_DIR=$HOME/.gdb-python

pushd $TMPDIR

svn co svn://gcc.gnu.org/svn/gcc/trunk/libstdc++-v3/python
mv python $GDB_PY_PRETTY_PRINT_DIR

cat <<GDBINIT >> ~/.gdbinit
python
import sys
sys.path.insert(0, '$GDB_PY_PRETTY_PRINT_DIR')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
GDBINIT

popd

rm -r $TMPDIR
