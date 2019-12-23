import os

from flask import Flask
import flaskr.Server
"""
   存在问题！
   config.py
"""
def create_app(test_config=None):
    app=Flask(__name__,instance_relative_config=True)
    # __name__为当前模块的名称
    app.config.from_mapping(SECRET_KEY='dev',DATABASE=os.path.join(app.instance_path,'flaskr.db'),)
    # app.config.from_mapping()设置一个应用的缺省配置
    if test_config is None:
        app.config.from_pyfile('config.py',slient=True)
    else:
        app.config.from_mapping(test_config)


    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass
    from . import auth
    app.register_blueprint(auth.bp)

    @app.route('/')
    def hello():
        return "Hello,MY name is BuBu!"
    return app


if __name__ == '__main__':
    Server()
