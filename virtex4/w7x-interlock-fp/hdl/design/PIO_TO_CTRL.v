// DISCLAIMER OF LIABILITY
//
// This text/file contains proprietary, confidential
// information of Xilinx, Inc., is distributed under license
// from Xilinx, Inc., and may be used, copied and/or
// disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc. Xilinx hereby grants you
// a license to use this text/file solely for design, simulation,
// implementation and creation of design files limited
// to Xilinx devices or technologies. Use with non-Xilinx
// devices or technologies is expressly prohibited and
// immediately terminates your license unless covered by
// a separate agreement.
//
// Xilinx is providing this design, code, or information
// "as is" solely for use in developing programs and
// solutions for Xilinx devices. By providing this design,
// code, or information as one possible implementation of
// this feature, application or standard, Xilinx is making no
// representation that this implementation is free from any
// claims of infringement. You are responsible for
// obtaining any rights you may require for your implementation.
// Xilinx expressly disclaims any warranty whatsoever with
// respect to the adequacy of the implementation, including
// but not limited to any warranties or representations that this
// implementation is free from claims of infringement, implied
// warranties of merchantability or fitness for a particular
// purpose.
//
// Xilinx products are not intended for use in life support
// appliances, devices, or systems. Use in such applications are
// expressly prohibited.
//
//
// Copyright (c) 2001, 2002, 2003, 2004, 2005, 2007 Xilinx, Inc. All rights reserved.
//
// This copyright and support notice must be retained as part
// of this text at all times.
//-- Filename: PIO_TO_CTRL.v
//--
//-- Description: Turn-off Control Unit.
//--
//--------------------------------------------------------------------------------

`timescale 1ns/1ns

module PIO_TO_CTRL    (

                        clk,
                        rst_n,

                        req_compl_i,
                        compl_done_i,

                        cfg_to_turnoff_n,
                        cfg_turnoff_ok_n

                        );

    input               clk;
    input               rst_n;

    input               req_compl_i;
    input               compl_done_i;

    input               cfg_to_turnoff_n;
    output              cfg_turnoff_ok_n;

    reg                 trn_pending;
    reg                 cfg_turnoff_ok_n;


    /*
     *  Check if completion is pending
     */

    always @ ( posedge clk or negedge rst_n ) begin

        if (!rst_n ) begin

          trn_pending <= 0;

        end else begin

          if (!trn_pending && req_compl_i)

            trn_pending <= 1'b1;

          else if (compl_done_i)

            trn_pending <= 1'b0;

        end

    end

    /*
     *  Turn-off OK if requested and no transaction is pending
     */

     always @ ( posedge clk or negedge rst_n ) begin

      if (!rst_n ) begin

        cfg_turnoff_ok_n <= 1'b1;

      end else begin

        if ( !cfg_to_turnoff_n  && !trn_pending)
          cfg_turnoff_ok_n <= 1'b0;
        else
          cfg_turnoff_ok_n <= 1'b1;

      end

    end


endmodule // PIO_TO_CTRL

