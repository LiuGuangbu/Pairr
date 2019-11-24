import functools

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash

# from flaskr.db import get_db
# 缺少get_db方法

# url_prefix会添加到所有与蓝图关联的URL前面
bp = Blueprint('auth', __name__, url_prefix='/auth')