class NeuralNetwork 
{
	var inputSize = 0
	var primeraCapa = null
	var ultimaCapa = null
	var resultadoInput = null
	var errorTerm = 0
	 
	method newNeuralNetwork(estructuraCapas) // Creamos una lista de N capas y recursivamente las conectamos unas a otras.
	{
		if (estructuraCapas.size() == 0)
		{
			
		}
		else
		{
			if (primeraCapa == null)
			{
				const primera = new Layer()
				inputSize = estructuraCapas.head()
			    primera.inicializarCapa(estructuraCapas.head(),estructuraCapas.drop(1).head())
				primeraCapa = primera
				ultimaCapa = primera
				self.newNeuralNetwork(estructuraCapas.drop(2))
			}
			else
			{
				const siguienteCapa = new Layer()
				siguienteCapa.capaAnterior(ultimaCapa)
				siguienteCapa.inicializarCapa(ultimaCapa.cantidadDeNeuronas(),estructuraCapas.head())
				ultimaCapa.capaSiguiente(siguienteCapa)
				ultimaCapa = siguienteCapa
				self.newNeuralNetwork(estructuraCapas.drop(1))
			}
		}
	}
	
	method procesarInput(input,outputEsperado)
	{
			resultadoInput = primeraCapa.procesar(input)
			errorTerm = 0
			self.lengthOfDiff(outputEsperado,resultadoInput)
			return errorTerm.sqrt()
		
	}
	
	method lengthOfDiff(x,y)
	{
		errorTerm = 
	}
}

class Layer
{
var capaAnterior = null
var capaSiguiente = null
const listaDeNeuronas = []

method capaAnterior(x)
{
	capaAnterior = x
}   

method capaSiguiente(x)
{
	capaSiguiente = x
}

method cantidadDeNeuronas()
{
	return listaDeNeuronas.size()
} 

method inicializarCapa(cantidadNeuronasCapaAnterior,cantidadDeNeuronasCapa)
{
	if (cantidadDeNeuronasCapa != 0)
	{
 const x = new Neurona(cantidadDePesos = cantidadNeuronasCapaAnterior)
 x.inicializarNeurona()
 listaDeNeuronas.add(x)
 self.inicializarCapa(cantidadNeuronasCapaAnterior,cantidadDeNeuronasCapa - 1)	
    }
}

method procesar(input)
{
	listaDeNeuronas.forEach({x => x.dotProduct(input)})
	var p = listaDeNeuronas.map({x => x.resultado()})
	if (capaSiguiente == null)
	{
		return p
	}
	else
	{
		return capaSiguiente.procesar(p)
	}
}


}

class Neurona
{
	const cantidadDePesos
	const pesos = []
	var resultado = 0
	
	method dotProduct(inputs)
	{
		resultado = 0
		self.dot(inputs,pesos)
		return resultado
		
	}
	
	method dot(inputs,peso)
	{
		if(inputs.size() == 0)
		{
		}
		else
		{
		
		resultado = peso.first() * inputs.first() 
		self.dot(inputs.drop(1),peso.drop(1))
		}
	}
	
	
	method resultado()
	{
		return resultado
	}
	
	method inicializarNeurona()
	{
	  self.agregarPeso(cantidadDePesos)
	}
 
    method agregarPeso(x)
    {
    	if (x != 0)
    	{
    	pesos.add((-1).randomUpTo(1))
    	self.agregarPeso(x-1)
    	}
    }
}


