object mOp
{
	var temp = []
	var rowSize = 0
	var columnSize = 0
	var cdot = 0
	
	method product(matrixOne,matrixTwo)
	{
		if(matrixOne.columnSize() == matrixTwo.rowSize())
		{
			rowSize = matrixOne.rowSize()
			columnSize = matrixTwo.columnSize()
			temp = [[]]
			return self.controlProduct(rowSize,columnSize,matrixOne,matrixTwo)
		}
		else return 0
	}
	
	method rowSize()
	{
		return rowSize
	}
	
	method columnSize()
	{
		return columnSize
	}
	
	method temp()
	{
		return temp
	}
	
	method controlProduct(n,m,matrix1,matrix2)
	{
		if (m == 0)
		{
		    	if (n == 1)
		    	{
		    		temp = temp.map({x => x.reverse()}).reverse()
		    		if(temp.size() == 1 and temp.first().size() ==1)
		    		{
		    			return temp.first().first()
		    		}
		    		return new Matrix(matrixList = temp)
		    	}
		    	else
		    	{
		    		temp.add([])
		    		return self.controlProduct(n-1,columnSize,matrix1,matrix2)
		    	}
		}
		
		
		
		else
		{
			temp.last().add(self.dotProduct(matrix1.row(n),matrix2.column(m)))
			return self.controlProduct(n,m-1,matrix1,matrix2)
		}
	}
	
	method dotProduct(x,y)
	{
		cdot = 0
		return self.iterateProduct(x,y,0,x.size())
	}
	
	method iterateProduct(x,y,m,max)
	{
		if (m == max)
		{
			return cdot
		}
		else
		{
			cdot = cdot + (x.get(m) * y.get(m))
			return self.iterateProduct(x,y,m+1,max)
		}
	}
}

class Matrix
{
	var property matrixList
	
	method multiply(otherMatrix)
	{
		return mOp.product(otherMatrix.matrix(),self.matrix())
	}
	
	method matrix()
	{
		return matrixList
	}
	
	method get(n,m)
	{
		return matrixList.get(n-1).get(m-1)
	}
	
	method columnSize()
	{
		return matrixList.first().size()
	}
	
	method rowSize()
	{
		return matrixList.size()
	}
	
	method row(n)
	{
		return matrixList.get(n-1)
	}
	
	method column(n)
	{
		return matrixList.map({row => row.get(n-1)})
	}
}


