package com.pro3.scaffold.type

import com.pro3.type.Strategy
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class StrategyController {
    static scaffold = Strategy
}
