require_relative '../test_helper'
require_relative '../../config/environment'
require_relative '../../db/seed'

DataMapper.auto_migrate!
Seed.seed