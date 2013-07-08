import projectDatabase
import os

filePath = os.path.abspath('./file')
if filePath != "":
  print filePath
  root = projectDatabase.createOrUpdateProjectForFile(filePath, [], {})
