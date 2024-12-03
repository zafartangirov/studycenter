package uz.pdp.demo9.studycenter;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReportData {
    private String name;
    private Long studentCount;
    private Long paymentAmount;
}
