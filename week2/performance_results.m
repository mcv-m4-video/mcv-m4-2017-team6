function [TP, FP, FN, TN] = performance_results(pixelCandidates, gt)
    
    pixelGt = gt==255;
    %gt_bg = gt <= 50;
    gt_eval1 = gt == 85;
    gt_eval2 = gt == 170;
    gt_eval = ~(gt_eval1 + gt_eval2);
    
    TP_mat = pixelCandidates>0 & pixelGt>0;
    FP_mat = pixelCandidates>0 & pixelGt==0;
    FN_mat = pixelCandidates==0 & pixelGt>0;
    TN_mat = pixelCandidates==0 & pixelGt==0;
    
    TP = sum(sum( TP_mat(gt_eval) ));
    FP = sum(sum( FP_mat(gt_eval) ));
    FN = sum(sum( FN_mat(gt_eval) ));
    TN = sum(sum( TN_mat(gt_eval) ));
    
    TP2 = sum(sum( TP_mat ));
    FP2 = sum(sum( FP_mat ));
    FN2 = sum(sum( FN_mat ));
    TN2= sum(sum( TN_mat ));
    
end
