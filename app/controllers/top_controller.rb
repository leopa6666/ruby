# coding: utf-8
class TopController < ApplicationController

  @testname = 'aaa'
  def index
    @testname = 'aaaaaaa'
  end

  def testbtn
    @testname = 'aaa'
  end

end
