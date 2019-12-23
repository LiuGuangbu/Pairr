#!"D:\JAVA\Android Studio\android github\Pairr\PairrService\venv\Scripts\python.exe"
# EASY-INSTALL-ENTRY-SCRIPT: 'pyhanlp==0.1.57','console_scripts','hanlp'
__requires__ = 'pyhanlp==0.1.57'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('pyhanlp==0.1.57', 'console_scripts', 'hanlp')()
    )
