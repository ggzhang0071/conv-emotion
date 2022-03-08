import pandas as pd
import nni
from sklearn.model_selection import cross_val_score
import xgboost as xgb
from sklearn.model_selection import KFold
import pickle

x_train = pickle.load(open("./data/x_train", 'rb'))
x_test = pickle.load(open("./data/x_test", 'rb'))

test = pd.read_csv("./data/test.csv")
train = pd.read_csv("./data/train.csv")

passengerId = test['PassengerId']
y_train = train['Survived'].ravel()

# 获取默认参数
def get_default_parameters():
     params = {
          'learning_rate': 0.02,
          'n_estimators': 2000,
          'max_depth': 4,
          'min_child_weight':2,
          'gamma':0.9,
          'subsample':0.8,
          'colsample_bytree':0.8,
          'objective':'binary:logistic',
          'nthread':-1,
          'scale_pos_weight':1
     }
     return params

# 获取模型
def get_model(PARAMS):
     model = xgb.XGBClassifier()
     model.learning_rate = PARAMS.get("learning_rate")
     model.max_depth = PARAMS.get("max_depth")
     model.subsample = PARAMS.get("subsample")
     model.colsample_btree = PARAMS.get("colsample_btree")
     return model

# 运行模型
kf = KFold(n_splits=5)
def run(x_train, y_train, model):
     scores = cross_val_score(model, x_train, y_train, cv=kf)
     score = scores.mean()
     nni.report_final_result(score)

if __name__ == '__main__':
     RECEIVED_PARAMS = nni.get_next_parameter()
     print(RECEIVED_PARAMS)
     PARAMS = get_default_parameters()
     PARAMS.update(RECEIVED_PARAMS)

     model = get_model(PARAMS)
     run(x_train, y_train, model)