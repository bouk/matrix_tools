require 'spec_helper'

describe :max_sum do
  it "gives the correct sum for a 1x1 matrix" do
    Matrix.build(1, 1) { 1 }.max_sum.should eql 1
  end

  it "gives the correct sum for a one row matrix" do
    columns = 10
    Matrix.row_vector([1] * columns).max_sum.should eql columns
  end

  it "gives the correct sum for a one column matrix" do
    rows = 10
    Matrix.column_vector([1] * rows).max_sum.should eql rows
  end

  it "gives the correct sum for a 2x2 matrix of ones" do
    Matrix.build(2, 2) { 1 }.max_sum.should eql 4
  end

  it "returns zero for a matrix that consists of only zeroes" do
    Matrix.build(10, 5) { 0 }.max_sum.should eql 0
  end

  it "gives the correct sum for a matrix that consists of only ones" do
    rows = 10
    columns = 5
    Matrix.build(rows, columns) { 1 }.max_sum.should eql (rows * columns)
  end

  it "returns zero for a matrix with only negative numbers" do
    Matrix.build(10, 10) { |row, column| -row * column }.max_sum.should eql 0
  end

  it "gives the correct sum for a random matrix" do
    Matrix.rows([
      [1,    2,  3, 4],
      [9, -100,  1, 1],
      [1,    0, 40, 3]
      ]).max_sum.should eql 52
  end
end
