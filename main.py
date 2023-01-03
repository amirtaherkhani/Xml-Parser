import os
import pathlib
from pathlib import Path
import xml.etree.ElementTree as ET

import pandas as pd
from numba import jit
import pandas as df
import numpy as np

tree = ET.parse("./data/kara/raw/PPM-R15m-NE13143-2018_09_03-19_30.xml")
root = tree.getroot()


def dict_update(dic:dict, new_sub_dic:dict) -> dict:
    new_dic = dic.copy()
    new_dic.update(new_sub_dic)
    return new_dic


# pool = Pool(os.cpu_count())
# pool.map(process_item, root_codes.findall('Entity'))

all_Entity = root.findall("Entity")
list_Entity = [dict_update(dict_update(Entity.attrib, Entity.findall(".//Details")[0].find(".//TimeStamp").attrib),{"Compliance":Entity.findall(".//Details")[0].find(".//Compliance").text}) for Entity in
               all_Entity]

df_Entity=pd.DataFrame(list_Entity)
print(df_Entity.columns)
print(df_Entity.head(1))

# list_TimeStamp  = [TimeStamp.attrib for TimeStamp in root.findall("TimeStamp")]
# df_TimeStamp=pd.DataFrame(list_TimeStamp)
# print(df_TimeStamp.columns)
