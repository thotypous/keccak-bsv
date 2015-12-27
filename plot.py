#!/usr/bin/python2.7
# -*- encoding: utf-8 -*-
import matplotlib.pyplot as plt
import numpy as np
from cStringIO import StringIO

plt.rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
plt.rc('text.latex', unicode=True)
plt.rc('text.latex', preamble=[r"\usepackage{helvet}",
                               r"\usepackage{nicefrac}",
                               r"\usepackage{amsmath}",
                               r"\DeclareSymbolFont{operators}{OT1}{phv}{sb}{n}",
                               r"\DeclareSymbolFont{letters}{OML}{phv}{sb}{it}",
                               r"\DeclareSymbolFont{symbols}{OMS}{cmsy}{sb}{n}",
                               r"\DeclareSymbolFont{largesymbols}{OMX}{cmex}{sb}{n}"])
plt.rc('text', usetex=True)

freq_bsv = np.loadtxt('freq.bsv.txt')
freq_vhdl = np.loadtxt('freq.vhdl.txt')

alms_bsv = np.loadtxt(StringIO(open('alms.bsv.txt').read().replace(',','')))
alms_vhdl = np.loadtxt(StringIO(open('alms.vhdl.txt').read().replace(',','')))

ax1 = plt.subplot(1,2,1)

ax1.hist(freq_bsv, bins=5, range=(200,260), fc=(0,0,.7,.5), label=u'BSV')
ax1.hist(freq_vhdl, bins=5, range=(200,260), fc=(1,0,0,.5), label=u'VHDL')

ax1.set_xlabel(u'Clock frequency (MHz)')
ax1.set_ylabel(u'Number of occurrences')

#ax1.legend(loc='upper right', prop={'size':11})

ax2 = plt.subplot(1,2,2,sharey=ax1)

ax2.hist(alms_bsv, bins=7, range=(985,1020), fc=(0,0,.7,.5), label=u'BSV')
ax2.hist(alms_vhdl, bins=7, range=(985,1020), fc=(1,0,0,.5), label=u'VHDL')

ax2.set_xlabel(u'Logic utilization (ALMs)')

ax2.legend(loc='upper right', prop={'size':11})

plt.tight_layout()
plt.savefig('synthesis.svg')
