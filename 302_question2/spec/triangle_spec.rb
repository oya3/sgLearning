# -*- coding: utf-8 -*-

# $LOAD_PATH.push(File.expand_path(File.dirname(__FILE__))+'/../')
# require 'triangle'
require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do
    specify { expect( Triangle.whatTriangle(2,3,4) ).to eq "不等辺三角形ですやん"}
    specify { expect( Triangle.whatTriangle(2,2,1) ).to eq "二等辺三角形ですやん"}
    specify { expect( Triangle.whatTriangle(1,1,1) ).to eq "正三角形ですやん" }
    specify { expect( Triangle.whatTriangle(1,2,3) ).to eq "三角形じゃないやん＞＜"}
end

