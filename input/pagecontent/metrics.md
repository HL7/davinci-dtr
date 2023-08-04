One of the main objectives of the DTR implementation guide (and the Burden Reduction guides as a whole) is to
improve efficiency of the healthcare system with respect to provider-payer interaction.  However, for this
objective to be achieved, it's important that the information provided by payers be useful and timely and
it's equally important that the relevant information from the EHR be available (and findable) for payers in
computable form.

EHRs, payers, and governing authorities such as CMS will all have an interest in understanding how well the
implementation of DTR is working.  

It is likely that formal metrics (likely using the [Measure]({{site.data.fhir.path}}measure.html) resource)
will be defined to help evaluate and potentially benchmark DTR implementations.  However, in order to evaluate
such measures, the relevant information will need to be available in both provider and payer systems to support
the measures.

In the interest of enabling such evaluation processes, this guide has defined a 
[logical DTR Metric model](StructureDefinition-DTRMetricData.html) that describes the data elements most
likely to be relevant for such evaluation.

This model is <u>NOT</u> a FHIR data structure for information exchange.  Instead, it is a logical model that describes
the types of data that should be available and any constraints on the data (e.g. cardinality, terminology) that
should be captured by DTR implementers to support the evaluation of metrics.  Measures can then be defined
in a standardized way based on these measures.

DTR implementers **SHOULD** store information for each DTR call in a manner that would allow them to respond to
measures based on this logical model.